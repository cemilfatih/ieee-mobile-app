// BU SAYFADA ETKİNLİK KATILIMCLARI LİSTELENECEK
// 2 ADET TABLO OLUR SÜREKLİ ONLAR GĞNCELLENİR

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:ieee_mobile_app/helper/helper.dart';
import "package:ieee_mobile_app/helper/user.dart";
import 'package:ieee_mobile_app/ieee_gtu_screens/etkinlik_kayit_panel.dart';
import 'toplantı_yoklama_kontrol.dart';
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


class etkinlik_yoklama_kontrol extends StatefulWidget {
  const etkinlik_yoklama_kontrol({Key? key}) : super(key: key);

  @override
  State<etkinlik_yoklama_kontrol> createState() => _etkinlik_yoklama_kontrolState();
}

class _etkinlik_yoklama_kontrolState extends State<etkinlik_yoklama_kontrol> {
  @override
  Widget build(BuildContext context) {


    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    List<String>  yoklamalist1 = ["Etkinliğe Kaydolanlar" ] ;

    //KATILIMCI LİSTESİ  BURAYA EKLENMELİ

    for(int etkinlik = 0 ; etkinlik < Helper.etkinlikListesi.length - 1; etkinlik++){
      yoklamalist1.add("Etkinlik" + (etkinlik + 1).toString() );
      for(int idx = 0; idx < Helper.etkinlikListesi[etkinlik].length; idx++){
        print("here");
        yoklamalist1.add(Helper.etkinlikListesi[etkinlik][idx]);
      }
    }

    //KATILIMCI LİSTESİ  BURAYA EKLENMELİ
    Future.delayed(Duration(seconds: 5));
    
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: () {
              Clipboard.setData(ClipboardData(text: yoklamalist1.join("\n ,") ,));
            }, child: Text("Listeyi Kopyala")),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(decoration: BoxDecoration(color: Colors.white),
                      height: height/1.3,
                      width: width/1.2,
                      child: ListView.builder(
                        itemCount: yoklamalist1.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(yoklamalist1[index],textAlign: TextAlign.center ,style: TextStyle(fontSize: 20,color: Colors.black)),
                          );
                        },
                      ),),
                  ),
                ),
              ],
            ),

          ],
        ),);
  }
}
