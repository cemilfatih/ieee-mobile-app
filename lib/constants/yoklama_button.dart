import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ieee_mobile_app/helper/user.dart';
import 'package:fluttertoast/fluttertoast.dart';


class yoklama_button extends StatefulWidget {

  String sifre;
  String tarih ;

  yoklama_button( this.sifre ,this.tarih );
  //int get rota => rota ;

  @override
  State<yoklama_button> createState() => _yoklama_buttonState();
}
class _yoklama_buttonState extends State<yoklama_button> {

  final sifreController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    //var boy= ( MediaQuery.of(context).size.height * 0.18);
    // var ic_boy = ( MediaQuery.of(context).size.height * 0.11);
    var width = ( MediaQuery.of(context).size.width);
    var height = ( MediaQuery.of(context).size.height);
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: width/1.3,
        height: height/9,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                offset: Offset(0,2),
                blurRadius: 6.0
            )
          ],
          gradient: LinearGradient(
            colors: [Colors.red,Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(60),//boy*0.28
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Expanded(flex: 1 ,child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Toplantı Şifresini Giriniz',
                  hintText: 'Şifre'
              ),
              controller: sifreController,
            ),),
            Expanded(flex: 1 ,child: Text(
                user.currentUser.committee, // KOMİTE İSMİ
                style: TextStyle(
                    fontSize: height/50,
                    fontWeight: FontWeight.bold)
            ),),

            Expanded(flex: 1 ,child: Text(
                widget.tarih, // KOMİTE TARİHİ
                style: TextStyle(
                  fontSize: height/70,
                )
            ),),
            Expanded(flex: 1 ,
              child: ElevatedButton(onPressed: () async{
                FirebaseFirestore firestore = FirebaseFirestore.instance;
                List<dynamic> l = [user.currentUser.id];
                String msg = "Toplantı için girdiğin şifre yanlış! Komite Başkanından şifreni tekrar al!";
                Color color = Colors.red;
                if(widget.sifre == sifreController.text){
                  firestore.collection("komiteler").doc(user.currentUser.committee).update({"toplantıyaKatılanlar": FieldValue.arrayUnion(l) });
                  msg = "Toplantı yoklaman başarıyla alındı. Teşekkür ederiz";
                  color = Colors.lightGreenAccent;
                }
                Fluttertoast.showToast(
                    msg: msg,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: color,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              },
                child: Text("BURADAYIM"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}