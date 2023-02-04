import 'package:flutter/material.dart';
import '../constants/bus_menu.dart';
import '../constants/app_bar.dart';
import '../constants/nvgbar2.dart';



void main() {
  runApp(const bus_page());
}

class bus_page extends StatelessWidget {
  const bus_page({super.key});


//double width = MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "TitilliumWeb" , ),
      debugShowCheckedModeBanner: false,
      home:
      Home(), // gereksiz bir hata verdiginden dolayo , home'u asaı attım .
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
var _currentIndex = 0;
class _HomeState extends State<Home> {
  var _currentIndex = 5;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var sol_bosluk = width * 0.05;
    final ieee_icon = "lib/assets/images/ieee_icon.png";
    final gtu_icon = "lib/assets/images/gtü_icon.png";

    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white,
          // drawer: side_menu(),
          // appBar: PreferredSize(
          //   preferredSize: Size.fromHeight(height / 12),
          //   child: app_bar(),
          // ),
          // bottomNavigationBar:  BottomNavBar(
          //   currentIndex: _currentIndex,
          //   onTap: (i) => setState(() { _currentIndex = i;}),//SizedBox(
          //   //height: height / 12,
          //   // child: nvg_bar(),
          // ),
          body: long_menu() // komiteler_menu den geliyor
      ),
    );
  }
}