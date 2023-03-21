import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/helper/helper.dart';


void main() {
  runApp(const etkinlik_kayit_panel());
}

class etkinlik_kayit_panel extends StatefulWidget {
  const etkinlik_kayit_panel({super.key});

  @override
  State<etkinlik_kayit_panel> createState() => _etkinlik_kayit_panelState();
}

class _etkinlik_kayit_panelState extends State<etkinlik_kayit_panel> {
  final nameController = TextEditingController();
  final notController = TextEditingController();
  final dateController = TextEditingController();

  @override

  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('etkinlik_kayit_olusturma_paneli'),
    ),
    body: ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        TextField( decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'ETKİNLİK ADI',
            hintText: 'Afişteki Başlık'
        ),
          controller: nameController,
        ),
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Etkinlik Hakkında',
              hintText: 'Kısa Bilgi'
          ),
          controller: notController,
        ),
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Tarih Giriniz',
              hintText: 'gün-ay-yıl'
          ),
          controller: dateController,
        ),
        ElevatedButton(onPressed: () async{
          await Helper.etkinlik_kayit(nameController.text, notController.text, dateController );


        }, child: Text('etkinlik_kayit'))
      ],

    ),
  );

}
