import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/enums/FirebaseCollectionsEnum.dart';
import 'package:ieee_mobile_app/features/splash/splashLogic.dart';
import 'package:ieee_mobile_app/models/appVersionModel.dart';

import '../../models/baseFirebaseModel.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child:
      Center(child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.ac_unit_outlined),
            Padding(padding: EdgeInsets.all(20.0),
            child: Text("Splash Sreen"),),
            TextButton(onPressed: (){
              Navigator.pushNamed(context, '/splashCodePage');
            }, child: Text("are you admin?"))

          ],
        ))),
    );
  }
}

class splashPassCodeView extends StatefulWidget {
  const splashPassCodeView({Key? key}) : super(key: key);

  @override
  State<splashPassCodeView> createState() => _splashPassCodeViewState();
}

class _splashPassCodeViewState extends State<splashPassCodeView> {
  var code;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _controller ,
              onSaved: (string){
                code = string;
              },
            ),

            TextButton(onPressed: () async {
              final code =  await splashLogic().getCode();

              code == _controller.text ? Navigator.pushNamed(context, "/homePage") : print("Invalid passcode");


              }, child: Text("Check the code"))
        ],),
      ),
    );
  }
}





