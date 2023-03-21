import 'package:flutter/material.dart';

import 'package:ieee_mobile_app/main.dart';

class kayit_button extends StatefulWidget {
  // Color renk1;
  // Color renk2;
  String aciklama;
  String baslik;
  String tarih ;

  kayit_button(this.aciklama, this.baslik ,this.tarih );
  //int get rota => rota ;

  @override
  State<kayit_button> createState() => _kayit_buttonState();
}
class _kayit_buttonState extends State<kayit_button> {



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
            Expanded(flex: 2,
              child: SizedBox(
                  width: width/1.5,
                  height: height/5,
                  child: Text(widget.aciklama),// ACIKLAMA
              ),
            ),
            Expanded(flex: 1 ,child: Text(
                widget.baslik, // ETKİNLİĞİN İSMİ
                style: TextStyle(
                fontSize: height/50,
                fontWeight: FontWeight.bold)
            ),),
            Expanded(flex: 1 ,child: Text(
                widget.tarih, // ETKİNLİĞİN TARİHİ
                style: TextStyle(
                    fontSize: height/70,
                    )
            ),),
            Expanded(flex: 1 ,
                child: ElevatedButton(onPressed: () {

                },
                child: Text("KATIL"),
                ),
            ),
          ],
        ),
      ),
    );
  }
}