// BU SAYFADA ETKİNLİK KATILIMCLARI LİSTELENECEK
// 2 ADET TABLO OLUR SÜREKLİ ONLAR GĞNCELLENİR

import "package:flutter/material.dart";
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




class etkinlik_kontrol extends StatefulWidget {
  const etkinlik_kontrol({Key? key}) : super(key: key);

  @override
  State<etkinlik_kontrol> createState() => _etkinlik_kontrolState();
}

class _etkinlik_kontrolState extends State<etkinlik_kontrol> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    List<String>  katilimcilist1 = ["A - BİLGİLER" , "B- BİLGİLER","A - BİLGİLER" , "B- BİLGİLER","A - BİLGİLER" , "B- BİLGİLER","A - BİLGİLER" , "B- BİLGİLER"] ;
    //KATILIMCI LİSTESİ  BURAYA EKLENMELİ

    List<String>  katilimcilist2 = ["A - BİLGİLER" , "B- BİLGİLER","A - BİLGİLER" , "B- BİLGİLER","A - BİLGİLER" , "B- BİLGİLER","A - BİLGİLER" , "B- BİLGİLER"] ;
    //KATILIMCI LİSTESİ  BURAYA EKLENMELİ

    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(decoration: BoxDecoration(color: Colors.red),
              height: height/3,
              child: ListView.builder(
              itemCount: katilimcilist1.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(katilimcilist1[index],textAlign: TextAlign.center ,style: TextStyle(fontSize: 20,color: Colors.black)),
                );
              },
            ),),
            Container(
              decoration: BoxDecoration(color: Colors.greenAccent),
              height: height/3,
              child: ListView.builder(
              itemCount: katilimcilist2.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(katilimcilist2[index],textAlign: TextAlign.center ,style: TextStyle(fontSize: 20,color: Colors.black)),
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
