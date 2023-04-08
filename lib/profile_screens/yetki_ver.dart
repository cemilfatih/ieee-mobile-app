import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/helper/helper.dart';
import "package:ieee_mobile_app/helper/user.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';


class yetki_ver extends StatefulWidget {
  yetki_ver({Key? key}) : super(key: key);

  @override
  _yetki_verState createState() => _yetki_verState();
}

class _yetki_verState extends State<yetki_ver> {


  final nameController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SafeArea(
        child:Scaffold(
            appBar: AppBar(
              title: Text('yetki verme '),
            ),
            body: ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                TextField( decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "İlgili kişinin ID'si",
                    hintText: 'id gir'
                ),
                  controller: nameController,
                ),


                ElevatedButton( style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),onPressed: () async{
                  await Helper.yetki_ver(nameController.text );
                  Fluttertoast.showToast(
                      msg: "Yetki başarıyla verildi",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.amber,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }, child: Text('2.seviye Yetki Ver')),
                ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),onPressed: () async{
                  await Helper.yetki_al(nameController.text );
                  Fluttertoast.showToast(
                      msg: "Yetki başarıyla verildi",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.amber,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }, child: Text('Yetkileri al')),
                ElevatedButton( style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),onPressed: () async{
                  await Helper.yuksek_yetki_ver(nameController.text );
                  Fluttertoast.showToast(
                      msg: "Yetki başarıyla verildi",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.amber,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }, child: Text('!!!Yüksek Yetki Ver!!!')),


              ],
            )

        ),
      ),
    );
  }
}
