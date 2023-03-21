import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ieee_mobile_app/helper/helper.dart';


mixin firebaseMixin {

  final fire_auth = FirebaseAuth.instance;

  CollectionReference? setCollection(String name) {

    try{
      final docUser = FirebaseFirestore.instance.collection(name);
      return docUser;

    }catch (error){
      print(error.toString());
    }
  }

  Future<void> setData( DocumentReference ref ,Map<String, dynamic> json) async{

    try{
      await ref.set(json);

    }catch (error){
      print(error.toString());
    }
  }



  Future<User?> createUser(String email , String password) async {
    try{

      var snapshot = await fire_auth.createUserWithEmailAndPassword(email: email, password: password);
      loginUser(email, password);

      return snapshot.user;

    }catch(error){

      print(error.toString());
    }

  }

  Future<bool> loginUser(String email , String password) async{
    try{

      await fire_auth.signInWithEmailAndPassword(email: email, password: password);

      return true;

    }catch(error){
      print(error.toString());
      return false;
    }
  }

  Future<void> checkEmailVerified(Timer timer, BuildContext context) async{
    final user = fire_auth.currentUser;

    await user!.reload();

    if(user!.emailVerified){
      timer.cancel();
      Navigator.pushReplacementNamed(context, "/homePage");

    }
  }





}
