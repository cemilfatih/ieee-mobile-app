import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/mixin/firebaseMixin.dart';
import 'package:ieee_mobile_app/main.dart';

class mailVerifyService extends StatefulWidget with firebaseMixin {
   mailVerifyService({Key? key}) : super(key: key);

  @override
  State<mailVerifyService> createState() => _mailVerifyServiceState();
}

class _mailVerifyServiceState extends State<mailVerifyService> {

  // firebase service
  // final _auth = mailVerifyService().fire_auth;
  //
  late Timer timer;
  late User? user;
  late bool isVerified;

  @override
  // void initState() {
  //
  //   user = _auth.currentUser;
  //   user!.sendEmailVerification();
  //
  //   timer = Timer.periodic( Duration(seconds: 3), (timer) async {
  //       mailVerifyService().checkEmailVerified(timer , context);
  //   });
  //
  //
  //   super.initState();
  // }

  @override
  // void dispose() {
  //   // TODO: implement dispose
  //   timer?.cancel();
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              child: Image.asset(height: height/3,
                  "lib/assets/images/verify.jpg"),
            ),
            Text(
              // "${user!.email} adresine bir mail gönderdik.Gönderdiğimiz linke tıklayarak hesabını onaylayabilir ve giriş yapabilirsin.",
              "Üye alma başvurun alındı, komite başkanınla iletişime geçerek üyeliğini onaylatıp ardından giriş yapabilirsin",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: height/50),
            ),
            // Text(
            //   " 'Spam' ve 'Gereksiz e-posta' klasörlerini kontrol etmeyi unutma!",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontSize: height/50 , fontWeight: FontWeight.bold ),
            // ),
            ElevatedButton(onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const main_page())
              );
            }, child: Text("Tamam"))
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text("We sent an e-mail to ${user!.email}. Please verify your e-mail address" ,style: Theme.of(context).textTheme.subtitle1)
    //     ],
    //   ),
    // );
  }
}
