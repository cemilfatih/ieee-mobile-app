import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/helper/helper.dart';

void main() {
  runApp(const panel());
}

class panel extends StatefulWidget {
  const panel({super.key});

  @override
  State<panel> createState() => _panelState();
}

class _panelState extends State<panel> {

  final postSiraController = TextEditingController();
  final postBaslikController = TextEditingController();
  final postTextController = TextEditingController();
  final postURLController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sosyal Medya Panel")),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField (
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Kacinci post degisecek gir! 1 - 5',
                    hintText: 'post sıralaması 1,2,3,4,5'
                ),controller: postSiraController,
              ),
              TextField (
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: ' 1post baslık',
                    hintText: 'Enter Your Name'
                ),controller: postBaslikController,),
              TextField (
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'caption',
                    hintText: 'Enter Your Name'
                ),controller: postTextController,),
              TextField (
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'resim url',
                    hintText: 'resim url i gir'
                ),controller: postURLController,),
              ElevatedButton(onPressed: () {
                  Helper.changePost(postSiraController.text, postBaslikController.text, postTextController.text, postURLController.text);
              }, child: Text("GÖNDER")),



            ],),
        )
    );
  }
}
