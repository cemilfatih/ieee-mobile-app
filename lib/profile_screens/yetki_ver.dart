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
                    labelText: 'Yetki alacak kişinin idsi',
                    hintText: 'id gir'
                ),
                  controller: nameController,
                ),


                ElevatedButton(onPressed: () async{
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
                }, child: Text('Yetki Ver')),


              ],
            )

        ),
      ),
    );
  }
}
