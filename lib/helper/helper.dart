

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:ieee_mobile_app/helper/user.dart';
import 'package:ieee_mobile_app/mixin/firebaseMixin.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'etkinlik.dart';

class Helper with firebaseMixin, ChangeNotifier{

  static bool isLogin = false;
  static int counter = 0;
  static bool isVerified = false;
  late user registerUser;
  static int etkinlikSayisi = 0;
  static List<List<String>> etkinlikler = [[]];

  // yonetici ozel
  static List<String> katilimcilar = [];
  static List<List<String>> etkinlikListesi = [[]];

  static Future<void> register(name, surname, mail, telNum, sClass, department, committee, password) async {

     final docUser = Helper().setCollection('users');
     //final docUsers = FirebaseFirestore.instance.collection('users').doc();

     final CollectionReference _userRef =
     FirebaseFirestore.instance.collection('users');
     final currentUser = await Helper().createUser(mail, password);

     // final CollectionReference _userRef =
     // FirebaseFirestore.instance.collection('user');
     // final currentUser = await Helper().createUser(mail, password);

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
      tarih: '2023-03-22 20:18:04Z',
      katilimcilar: [],
    );

    final json = registerEtkinlik.toJson();
    await docEtkinliker.set(json);
    etkinlikSayisiHesapla();
  }
  static Future<int> etkinlikSayisiHesapla() async{
    etkinlikSayisi = 0;
    etkinlikler = [];

    List<String> tempEtkinlik = [];

    await FirebaseFirestore.instance
        .collection('etkinlikler')
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
            tempEtkinlik = [];

            tempEtkinlik.add(doc["ad"] ?? "");

            tempEtkinlik.add(doc["tarih"] ?? "");

            tempEtkinlik.add(doc["not"] ?? "");

            tempEtkinlik.add(doc["id"] ?? "");
            tempEtkinlik.add(doc["komite"] ?? "");

            etkinlikler.add(tempEtkinlik);

            etkinlikSayisi++;
        });
    });

    return etkinlikSayisi;
  }

  static Future<void> yoneticiEtkinlik() async{

    for(int etkinlik = 0 ; etkinlik < Helper.etkinlikSayisi; etkinlik++){

      if (Helper.etkinlikler[etkinlik][4] == user.currentUser.committee){

        await katilimcilariAl(Helper.etkinlikler[etkinlik][3]);

      }
    }

  }

  static Future<void> katilimcilariAl(etkinlikID) async{
    katilimcilar = [];

    await FirebaseFirestore.instance
        .collection('etkinlikler')
        .get()
        .then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((doc) {
        if(doc["id"] == etkinlikID){
          List.from( doc["katilimcilar"] ).forEach((element) {
            katilimcilar.add(element.toString());
          });
        }
      });
    });
    katilimcilar.forEach((element) {etkinlikListesi[counter].add(element);print("eklendi");});
    etkinlikListesi.add([]);

    counter++;
  }


  static void logout(){
    isLogin = false;
  }

  static bool isLog(){
    return isLogin;
  }

  static void userEtkinlikKayit(etkinlikID) async{

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<dynamic> l = [etkinlikID];
    List<dynamic> ls = [user.currentUser.id];

    firestore.collection("users").doc(user.currentUser.id).update({"katEtkinlikler": FieldValue.arrayUnion(l) });
    firestore.collection("etkinlikler").doc(etkinlikID).update({"katilimcilar": FieldValue.arrayUnion(ls) });


  }


}

