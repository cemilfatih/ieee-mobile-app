import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/features/splash/splashScreen.dart';
import 'package:ieee_mobile_app/features/splash/splashView.dart';
import 'package:ieee_mobile_app/ieee_gtu_screens/etkinlik_kayit_panel.dart';
import 'package:ieee_mobile_app/logic/isLoading.dart';
import 'package:ieee_mobile_app/logic/mail_verify.dart';
import 'package:ieee_mobile_app/screens/ana_sayfa.dart';
import 'package:ieee_mobile_app/screens/profile_page.dart';
import 'package:ieee_mobile_app/screens/gtu_menu.dart';
import 'Firebase/firebase_options.dart';
import 'constants/app_bar.dart';
import 'constants/nvg_bar.dart'; // yedek animasyonsuz navbar
import 'constants/nvgbar2.dart';
import 'package:ieee_mobile_app/screens/ieee_gtu_menu.dart';
import 'package:flutter/services.dart';
import 'package:ieee_mobile_app/constants/stateData.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ieee_mobile_app/profile_screens/signupPage.dart';



import 'helper/helper.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // YAN DÖNDÜRMEMESİ İÇİN KOD

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  //DeviceUtility.instance.initPackageInfo();
// checking user is already login or not
  Helper.loginwithID();
  Helper.getLiveEventId();

  runApp(main_page());

}
// //////////////////splash screen
// class splash extends StatefulWidget {
//   @override
//   _splashState createState() => _splashState();
// }
//
// class _splashState extends State<splash> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 1), () {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => Home()));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Container(child: Image(image: AssetImage("lib/assets/images/splash.png"),)),
//         decoration: BoxDecoration(color: Color(0xff00609c)),
//       ),
//     );
//   }
// }
// ////// splash screen


class main_page extends StatelessWidget {
  const main_page({super.key});

//double width = MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StateData()),
        ChangeNotifierProvider(create: (_) => loading())
      ],
      child: MaterialApp(
        routes: {
          "/verifyPage"   :(context) => mailVerifyService(),
          "/registerPage" :(context) => SignupPage(),
          "/homePage"     :(context) => Home(),
          "/splashCodePage":(context)=> splashPassCodeView()
        },
        theme: ThemeData(
          fontFamily: "TitilliumWeb",
        ),
        debugShowCheckedModeBanner: false,
        home: splashView(),
      ),

    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var _currentIndex = Provider.of<StateData>(context).mainIndex;

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var sol_bosluk = width * 0.05;
    final ieee_icon = "lib/assets/images/ieee_icon.png";
    final gtu_icon = "lib/assets/images/gtü_icon.png";

    var _pages = [

      ana_sayfa(sol_bosluk: sol_bosluk, height: height, ieee_icon: ieee_icon),
      gtu_menu(),
      ieee_gtu_menu(),
      profile_page()
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: side_menu(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height / 12),
          child: app_bar(),
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(
                () {
              Provider.of<StateData>(context, listen: false).newIndexMain(i);
              Provider.of<StateData>(context, listen: false).newIndexIeee(0);
              Provider.of<StateData>(context, listen: false).newIndexGtu(0);
              Provider.of<StateData>(context, listen: false).newIndexProfile(0);
              Provider.of<StateData>(context, listen: false).newIndexHizliErisim(0);
              // _currentIndex = i;
            },
          ), //SizedBox(
        ),
        body: Center(
          child: _pages.elementAt(_currentIndex),
        ),
      ),
    );
  }
}