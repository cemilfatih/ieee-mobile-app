import "package:flutter/material.dart";
import "package:ieee_mobile_app/helper/user.dart";
import 'package:ieee_mobile_app/ieee_gtu_screens/etkinlik_kayit_panel.dart';
import 'etkinlik_kontrol.dart';
import 'yoklama_kontrol.dart';

// Column loginTrue(double height, double width) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       CircleAvatar(
//         radius: height / 17,
//         backgroundImage:
//         NetworkImage('https://www.example.com/images/profile.jpg'),
//       ),
//       Text(
//         'Melih Tumur',
//         style: TextStyle(
//           fontSize: height / 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       Text(
//         'COMPUTER SOCIETY',
//         style: TextStyle(
//           fontSize: height / 45,
//           color: Colors.teal[100],
//           letterSpacing: 2.5,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       SizedBox(
//         height: height / 40,
//         width: width / 1.5,
//         child: Divider(
//           color: Colors.teal.shade100,
//         ),
//       ),
//       tercih_card(height, Icons.school, "Elektronik Mühendisliği"),
//       tercih_card(
//         height,
//         Icons.notification_important,
//         "Computer Society Bildirimleri \n Elk müh bildirimleri \n Comsoc Bildirimleri \n Genel Okul Duyuruları",
//       ),
//     ],
//   );
// }

Card tercih_card(
  double height,
  icon,
  icerik,
) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    child: ListTile(
      leading: Icon(
        icon,
        color: Colors.teal,
      ),
      title: Text(
        icerik,
        style: TextStyle(
          // color: Colors.teal.shade900,
          fontSize: height / 45,
        ),
      ),
    ),
  );
}

class loginTrue extends StatefulWidget {
  const loginTrue({Key? key}) : super(key: key);

  @override
  State<loginTrue> createState() => _loginTrueState();
}

class _loginTrueState extends State<loginTrue> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(

      // SADECE KOMİTE BASKANINA  GÖZÜKECEK 2 BUTON
        floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton( backgroundColor: Colors.red,
                onPressed: () => {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => etkinlik_kontrol()),
                )
                },
                // ETKİNLİK KATILIMCILARINI LİSTELEYEN SAYFAYA SAYFAYA GİDER
                child: Icon(Icons.event),
                heroTag: "etkinlik",
              ),
              SizedBox(width: 10,),
              FloatingActionButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => yoklama_kontrol()),
                  )
                },
                // YOKLAMAYI LİSTEYELEN SAYFAYA GİDER
                child: Icon(Icons.person_off),
                heroTag: "yoklama",
              ),
            ]
        ),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: height / 17,
          backgroundImage:
              NetworkImage('https://www.example.com/images/profile.jpg'),
        ),
        Text(

          "${user.currentUser.name[0].toUpperCase()}${user.currentUser.name.substring(1).toLowerCase()}" + " "
              "${user.currentUser.surname[0].toUpperCase()}${user.currentUser.surname.substring(1).toLowerCase()}",

          style: TextStyle(
            fontSize: height / 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(

          user.currentUser.committee,

          style: TextStyle(
            fontSize: height / 45,
            color: Colors.teal[100],
            letterSpacing: 2.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: height / 40,
          width: width / 1.5,
          child: Divider(
            color: Colors.teal.shade100,
          ),
        ),

        tercih_card(height, Icons.school, user.currentUser.department),

        tercih_card(
          height,
          Icons.notification_important,
          "Computer Society Bildirimleri \n Elk müh bildirimleri \n Comsoc Bildirimleri \n Genel Okul Duyuruları",
        ),
      ],
    ));
  }
}
