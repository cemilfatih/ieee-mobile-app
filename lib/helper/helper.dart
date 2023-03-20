

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:ieee_mobile_app/helper/user.dart';
import 'package:ieee_mobile_app/mixin/firebaseMixin.dart';
import 'package:provider/provider.dart';

class Helper with firebaseMixin, ChangeNotifier{

  static bool isLogin = false;
  static bool isVerified = false;
  late user registerUser;


  static Future<void> register(name, surname, mail, telNum, sClass, department, committee, password) async {

     final docUser = Helper().setCollection('user');

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
        level: 1

     );

     print(registerUser.toJson());

    final json = registerUser.toJson();

  //navigate to verify page and get register
     await docUser!.doc(currentUser!.uid).set(json);


  }

  static Future<void> login(mail, password) async {

    isLogin = await  Helper().loginUser(mail, password) ? true : false;

    /*
    await FirebaseFirestore.instance
    .collection('users')
    .get()
    .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(doc["mail"] == mail && password == doc["password"]) {
          isLogin = true;
        }
      });
    });

    if(isLogin){

      print("correct Password!");
    }
    else{
      print("wrong password");
    }

     */

  }

  static void logout(){
    isLogin = false;
  }

  static bool isLog(){
    return isLogin;
  }


}

