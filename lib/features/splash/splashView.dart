import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/features/splash/splashLogic.dart';
import 'package:ieee_mobile_app/features/splash/splashScreen.dart';
import 'package:ieee_mobile_app/main.dart';

class splashView extends StatefulWidget {
  const splashView({Key? key}) : super(key: key);

  @override
  State<splashView> createState() => _splashViewState();
}

class _splashViewState extends State<splashView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: splashLogic().checkAppVersion(),
        builder: (BuildContext context,
        AsyncSnapshot<bool> snapshot ){

          switch (snapshot.connectionState){
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return splashScreen();
            case ConnectionState.done:
              return snapshot.data! ? Home() : splashScreen();

    }
    throw Exception("Can not receive connection state info while getting version state");

    }
    );}
  }

