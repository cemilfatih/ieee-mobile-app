import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/helper/helper.dart';
import "etkinlik_kayit_panel.dart";
import 'package:ieee_mobile_app/constants/kayit_button.dart';
import 'package:ieee_mobile_app/helper/user.dart'    ;

void main()  {


  Helper.etkinlikSayisiHesapla();
  print("hello");
  runApp(const etkinlik_kayit());
}

class etkinlik_kayit extends StatefulWidget {
  const etkinlik_kayit({super.key});


  @override
  State<etkinlik_kayit> createState() => _etkinlik_kayitState();
}

class _etkinlik_kayitState extends State<etkinlik_kayit> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(

        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => etkinlik_kayit_panel()),
              );
            },
            child: Icon(Icons.add_circle_outline_rounded),
            backgroundColor: Colors.indigo),
        body: Column(
            children: [

              for( int x = 0; x <= Helper.etkinlikSayisi ;x++)...[
                Container(
                child: kayit_button("acıklama,acıklama,acıklama,acıklama,acıklama,acıklama,acıklama,acıklama,acıklama,acıklama,acıklama,acıklama", "baslik" , "1.1.2022"),
                ),
              ],
            ],
        )
      ),
    );
  }
}
