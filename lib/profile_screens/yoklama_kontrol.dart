// BU SAYFADA ETKİNLİK KATILIMCLARI LİSTELENECEK
// 2 ADET TABLO OLUR SÜREKLİ ONLAR GĞNCELLENİR

import "package:flutter/material.dart";
import 'package:ieee_mobile_app/helper/helper.dart';
import "package:ieee_mobile_app/helper/user.dart";
import 'package:ieee_mobile_app/ieee_gtu_screens/etkinlik_kayit_panel.dart';
import 'etkinlik_kontrol.dart';
//
// Card tercih_card(
//     double height,
//     icon,
//     icerik,
//     ) {
//   return Card(
//     margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
//     child: ListTile(
//       leading: Icon(
//         icon,
//         color: Colors.teal,
//       ),
//       title: Text(
//         icerik,
//         style: TextStyle(
//           // color: Colors.teal.shade900,
//           fontSize: height / 45,
//         ),
//       ),
//     ),
//   );
// }
//


class yoklama_kontrol extends StatefulWidget {
  const yoklama_kontrol({Key? key}) : super(key: key);

  @override
  State<yoklama_kontrol> createState() => _yoklama_kontrolState();
}

class _yoklama_kontrolState extends State<yoklama_kontrol> {
  @override
  Widget build(BuildContext context) {


    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    List<String>  yoklamalist1 = ["YOKLAMA BILGILER" ] ;

    //KATILIMCI LİSTESİ  BURAYA EKLENMELİ

    for(int etkinlik = 0 ; etkinlik < Helper.etkinlikListesi.length - 1; etkinlik++){
      yoklamalist1.add("Etkinlik" + (etkinlik + 1).toString() );
      for(int idx = 0; idx < Helper.etkinlikListesi[etkinlik].length; idx++){
        print("here");
        yoklamalist1.add(Helper.etkinlikListesi[etkinlik][idx]);
      }
    }

    //KATILIMCI LİSTESİ  BURAYA EKLENMELİ

    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(decoration: BoxDecoration(color: Colors.blue),
              height: height/3,
              child: ListView.builder(
                itemCount: yoklamalist1.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(yoklamalist1[index],textAlign: TextAlign.center ,style: TextStyle(fontSize: 20,color: Colors.black)),
                  );
                },
              ),),

            // tercih_card(height, Icons.school, user.currentUser.department ),
            // tercih_card(
            //   height,
            //   Icons.notification_important,
            //   "Computer Society Bildirimleri \n Elk müh bildirimleri \n Comsoc Bildirimleri \n Genel Okul Duyuruları",
            // ),
          ],
        ));
  }
}
