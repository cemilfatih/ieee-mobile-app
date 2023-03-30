import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/helper/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() {
  runApp(const yoklama_panel());
}

class yoklama_panel extends StatefulWidget {
  const yoklama_panel({super.key});

  @override
  State<yoklama_panel> createState() => _yoklama_panelState();
}

class _yoklama_panelState extends State<yoklama_panel> {
  final tarihController = TextEditingController();
  final sifreController = TextEditingController();

  @override

  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('yoklama_olusturma_paneli'),
    ),
    body: ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[

        TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Toplantı Tarihini Giriniz',
              hintText: 'gün-ay-yıl-saat-dakika => 30-03-2023-17-30'
          ),
          controller: tarihController,
        ),
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Toplantı Şifresini Giriniz',
              hintText: 'Şifre'
          ),
          controller: sifreController,
        ),
        ElevatedButton(onPressed: () async{
          await FirebaseFirestore.instance
              .collection('komiteler')
              .doc(user.currentUser.committee)
              .update({"toplantı":"1", "toplantıTarihi":tarihController.text, "toplantıSifresi":sifreController.text});
          Fluttertoast.showToast(
              msg: "Yoklama Basariyla Olusturuldu",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.amber,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }, child: Text('Toplantı Olustur')),
        
        ElevatedButton(onPressed: () async{
          await FirebaseFirestore.instance
              .collection('komiteler')
              .doc(user.currentUser.committee)
              .update({"toplantıyaKatılanlar":[]});
        }, child: Text('Önceki Toplantı Kayıtlarını sil!'))
      ],

    ),
  );

}
