import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/helper/user.dart';
import 'package:ieee_mobile_app/mixin/firebaseMixin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'etkinlik.dart';

class Helper with firebaseMixin, ChangeNotifier{
  static int komitePage = 0;
  static bool isLogin = false;
  static int etkinlikSayisi = 0;
  static List<List<String>> etkinlikler = [[]];

  static List<List<String>> onaylanacakUyeler = [[]];
  static int onaylanacakUyeSayisi = 0;

  static bool isRegistered = false;
  static String liveEventID = "";
  static bool isVerifiedUser = false;
  // yonetici ozel

  static Future<bool> register(name, surname, mail, telNum, sClass, department, committee, password) async {

    final docUser = Helper().setCollection('users');
    //final docUsers = FirebaseFirestore.instance.collection('users').doc();

    final currentUser = await Helper().createUser(mail, password);

    if(currentUser == null) {
      Fluttertoast.showToast(
          msg: "Lütfen Geçerli bir e-posta ve/ya şifre gir!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.amber,
          textColor: Colors.white,
          fontSize: 16.0
      );
      return false;
    }
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

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<dynamic> l = [currentUser!.uid];

    //hata veriyor

    await firestore.collection("komiteler").doc(committee).update({"onaylanacakUyeler": FieldValue.arrayUnion(l) });
    isRegistered = true;


    Fluttertoast.showToast(
        msg: "Başarıyla Kayıt Oldun Seni Giriş Sayfasına Yöneltiyorum!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0
    );
    return true;
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
      tarih: date,
      katilimcilar: [],
    );

    final json = registerEtkinlik.toJson();
    await docEtkinliker.set(json);

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<dynamic> l = [docEtkinliker.id];

    firestore.collection("users").doc(user.currentUser.id).update({"yapilanEtkinlikler": FieldValue.arrayUnion(l) });
  }

  static Future<String> getNameAndPhoneFromID(id) async{

    await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .get()
        .then((value){
      return value.data()!["name"] + " " + value.data()!["surname"] + " " + value.data()!["telephone"];
    });

    return "null";
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

  static void etkinlikSil(String etkinlikID) async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<dynamic> l = [etkinlikID];

    firestore.collection("etkinlikler").doc(etkinlikID).delete();
    firestore.collection("users").doc(user.currentUser.id).update({"yapilanEtkinlikler": FieldValue.arrayRemove(l)} );

  }

  static void changePost(postSiraController, postBaslikController, postTextController, postURLController) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("instagram").doc(postSiraController).update({"baslık":postBaslikController,"text":postTextController,"image":postURLController});
  }

  static Future<void> getLiveEventId() async {

    await FirebaseFirestore.instance
        .collection('youtube')
        .doc('id')
        .get()
        .then((value){
      liveEventID = value["id"];
    });

  }

  static yetki_ver(String id) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("users").doc(id).update({'level':2});
  }

  static yetki_al(String id) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("users").doc(id).update({'level':1});
  }

  static yuksek_yetki_ver(String id) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("users").doc(id).update({'level':3});
  }

  static Future<void> isVerified(String? uid) async {

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value){
        if(value["onay"].toString() == "1") isVerifiedUser = true;
    });

  }

  static void userOnay(String id) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("users").doc(id).update({'onay':1});

    List<dynamic> l = [id];
    firestore.collection("komiteler").doc(user.currentUser.committee).update({"onaylanacakUyeler": FieldValue.arrayRemove(l)} );

    firestore.collection("komiteler").doc(user.currentUser.committee).update({"uyeler": FieldValue.arrayUnion(l) });
  }


}