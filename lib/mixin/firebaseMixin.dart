import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ieee_mobile_app/helper/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

  Future<bool> loginUserWithId(id) async{

    try{
      bool flag = false;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .get()
          .then((value) {
              user.currentUser = new user( id: value["id"],
                  name: value["name"],
                  surname: value["surname"],
                  mail: value["mail"],
                  telNum: value["telephone"],
                  sClass: value["sClass"],
                  department: value["department"],
                  committee: value["committee"],
                  password: value["password"],
                  level: value["level"]
              );
              flag = true;
          });

      return flag;

    }catch(error){
      print(error.toString());
      return false;
    }
  }
  Future<bool> loginUser(String email , String password) async{
    try{
      await fire_auth.signInWithEmailAndPassword(email: email, password: password);
      bool flag = false;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(fire_auth.currentUser?.uid)
          .get()
          .then((value) {
        user.currentUser = new user( id: value["id"],
            name: value["name"],
            surname: value["surname"],
            mail: value["mail"],
            telNum: value["telephone"],
            sClass: value["sClass"],
            department: value["department"],
            committee: value["committee"],
            password: value["password"],
            level: value["level"]
        );
        flag = true;
      });

      if(flag){ // save user local
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', user.currentUser.id);
      }
      return flag;

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
