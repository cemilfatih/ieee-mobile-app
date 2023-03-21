import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/helper/helper.dart';


void main() {
  runApp(const etkinlik_kayit());
}

class etkinlik_kayit extends StatefulWidget {
  const etkinlik_kayit({super.key});

  @override
  State<etkinlik_kayit> createState() => _etkinlik_kayitState();
}

class _etkinlik_kayitState extends State<etkinlik_kayit> {
  final nameController = TextEditingController();
  final notController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('etkinlik_kayit'),
    ),
    body: ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        TextField(
          controller: nameController,
        ),
        TextField(
          controller: notController,
        ),
        TextField(
          controller: dateController,
        ),
        ElevatedButton(onPressed: () async{
          await Helper.etkinlik_kayit(nameController.text, notController.text, dateController );


        }, child: Text('etkinlik_kayit'))
      ],

    ),
  );

}
