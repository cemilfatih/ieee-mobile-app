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

    return WillPopScope(
      onWillPop: () async {
        setState(() {
          Provider.of<StateData>(context, listen: true).newIndexProfile(0);
        });
        return false;
      },
      child: Scaffold(
        body: Helper.isLogin ? loginTrue() : notLogin(),
      ),
    );
  }
}

  //
  // return Scaffold(
  // body: Center(child : _pages.elementAt(currentIndex),
  //

