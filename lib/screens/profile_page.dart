import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/profile_screens/notLogin.dart';
import "package:ieee_mobile_app/profile_screens/loginPage.dart";
import "package:ieee_mobile_app/profile_screens/signupPage.dart";
import 'package:provider/provider.dart';
import 'package:ieee_mobile_app/constants/stateData.dart';
import 'package:ieee_mobile_app/profile_screens/loginTrue.dart';
import 'package:ieee_mobile_app/helper/helper.dart';

class profile_page extends StatefulWidget {
  const profile_page({super.key});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  @override
  Widget build(BuildContext context) {
    var currentIndex = Provider
        .of<StateData>(context)
        .profileIndex;
    ;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var _pages = [

      if ( Helper.isLogin ) loginTrue()
      else notLogin()

     // loginTrue(), // GİRİŞ YAPTIYSA GÖZÜKECEK EKRAN
     // notLogin(), // GİRİŞ YAPMAN GEREK EKRANI

      //LoginPage(), // GİRİŞ YAPMA EKRANI
      //SignupPage(), // KAYIT OLMANI EKRANI
    ];

    // LOGİNİN SAYFA DÖNÜŞÜMLERİNİ YAPMAK İÇİN BENİMLE KONUSMANIZ GEREKİYOR

    if (currentIndex == 0) {
      return _pages[currentIndex];
        //CURRENTINDEX 0 İKEN GİRİŞ YAPILMIŞ HALDEKİ EKRAN GÖZÜKÜR
    } else {
      return WillPopScope(
        onWillPop: () async {
          setState(() {
            Provider.of<StateData>(context, listen: false).newIndexProfile(0);
          });
          return false;
        },
        child: Scaffold(
          body: _pages[currentIndex],
        ),
      );
    }
  }
}

  //
  // return Scaffold(
  // body: Center(child : _pages.elementAt(currentIndex),
  //

