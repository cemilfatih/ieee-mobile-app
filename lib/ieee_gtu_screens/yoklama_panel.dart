import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/helper/helper.dart';


void main() {
  runApp(const yoklama_panel());
}

class yoklama_panel extends StatefulWidget {
  const yoklama_panel({super.key});

  @override
  State<yoklama_panel> createState() => _yoklama_panelState();
}

class _yoklama_panelState extends State<yoklama_panel> {

  @override

  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('yoklama_olusturma_paneli'),
    ),
    body: ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        TextField( decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'TOPLANTI KOMİTESİ',
            hintText: 'komite adı'
        ),
          controller: null,
        ),
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Tarih Giriniz',
              hintText: 'gün-ay-yıl'
          ),
          controller: null,
        ),
        ElevatedButton(onPressed: () async{

        }, child: Text('etkinlik_kayit'))
      ],

    ),
  );

}
