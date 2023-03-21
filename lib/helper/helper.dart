

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:ieee_mobile_app/helper/user.dart';
import 'package:ieee_mobile_app/mixin/firebaseMixin.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'etkinlik.dart';

class Helper with firebaseMixin, ChangeNotifier{

  static bool isLogin = false;
  static bool isVerified = false;
  late user registerUser;


  static Future<void> register(name, surname, mail, telNum, sClass, department, committee, password) async {

     final docUser = Helper().setCollection('users');
     //final docUsers = FirebaseFirestore.instance.collection('users').doc();

     final CollectionReference _userRef =
     FirebaseFirestore.instance.collection('users');
     final currentUser = await Helper().createUser(mail, password);

     final CollectionReference _userRef =
     FirebaseFirestore.instance.collection('user');
     final currentUser = await Helper().createUser(mail, password);

     final registerUser = user(
        id: currentUser!.uid,
        name: name,
        surname: surname,
        mail: mail,
        telNum: telNum,
        sClass: sClass,
        department: department,
        committee: committee,
        password: password,

        level: 1,
         katEtkinlikler: <String>[],

     );


    final json = registerUser.toJson();
     //await docUsers.set(json);
  //navigate to verify page and get register
     await docUser!.doc(currentUser!.uid).set(json);


  }

  static Future<void> loginwithID() async {
    // checking user is already login or not

    final prefs = await SharedPreferences.getInstance();
    final String? id = prefs.getString('user');

    if(id != null) {
      if(id != -1)
        isLogin = await Helper().loginUserWithId(id) ? true : false;
    }
  }

  static Future<void> login(mail, password) async {

    isLogin = await  Helper().loginUser(mail, password) ? true : false;

  }

  static Future<void> etkinlik_kayit(name, notes, date) async{
    final docEtkinliker = FirebaseFirestore.instance.collection('etkinlikler').doc();

    final registerEtkinlik = etkinlik(
      id: docEtkinliker.id,
      ad: name,
      not: notes,
      komite: user.currentUser.committee,
      date: Timestamp.fromDate(DateTime.parse('2023-03-22 20:18:04Z')),
      katilimcilar: <dynamic>[],
    );

    final json = registerEtkinlik.toJson();
    await docEtkinliker.set(json);

  }

  static void logout(){
    isLogin = false;
  }

  static bool isLog(){
    return isLogin;
  }


}

