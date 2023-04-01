import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import "package:ieee_mobile_app/helper/user.dart";
import "package:ieee_mobile_app/helper/helper.dart";
import 'package:ieee_mobile_app/ieee_gtu_screens/etkinlik_kayit_panel.dart';
import 'package:ieee_mobile_app/mixin/firebaseMixin.dart';
import '../main.dart';
import 'toplantı_yoklama_kontrol.dart';
import 'etkinlik_yoklama_kontrol.dart';

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
    IconData icon,
    String icerik,
    ) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    color: Colors.blue.shade100,
    child: InkWell(
      borderRadius: BorderRadius.circular(20.0),
      splashColor: Colors.tealAccent,

      onTap: () {
        // Buraya tıklama olayını ekleyebilirsiniz
      },
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.purple,
        ),
        title: Text(
          icerik,
          style: TextStyle(
            color: Colors.black,
            fontSize: height / 40,
          ),
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
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end ,
          children: [
            Visibility(
              visible: user.currentUser.level > 1 ? true : false,
              child:
              Row( mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Toplantı Yoklamaları"  , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.red), ),
                  SizedBox(width: 10,),
                  FloatingActionButton( backgroundColor: Colors.red,
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => toplanti_yoklama_kontrol()),
                      )
                    },
                    // ETKİNLİK KATILIMCILARINI LİSTELEYEN SAYFAYA SAYFAYA GİDER
                    child: Icon(Icons.perm_contact_cal_rounded),
                    heroTag: "etkinlik",
                  ),
                ],
              ),),
            Visibility(
              visible: user.currentUser.level > 1 ? true : false,
              child:
              Row( mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Etkinlik Yoklamaları" , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.blue),),
                  SizedBox(width: 10),
                  FloatingActionButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => etkinlik_yoklama_kontrol()),
                      )
                    },
                    // YOKLAMAYI LİSTEYELEN SAYFAYA GİDER
                    child: Icon(Icons.event_busy_outlined),
                    heroTag: "yoklama",
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            CustomPaint(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              painter: HeaderCurvedContainer(),
            ),
            PageHeader(),

            Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Column(
                        children: [
                          SizedBox(height:height/4),
                          /*  CircleAvatar(
                            radius: height / 17,
                            backgroundImage:
                            NetworkImage('https://www.example.com/images/profile.jpg'),
                          ),*/
                          Text(

                            "Hoşgeldin, "+"- "+ "${user.currentUser.name[0].toUpperCase()}${user.currentUser.name.substring(1).toUpperCase()} "
                                "${user.currentUser.surname.toUpperCase()}",
                            style: TextStyle(
                              fontSize: height / 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            user.currentUser.committee+ " " + "Komite üyesi",

                            style: TextStyle(
                              fontSize: height / 45,
                              color: Colors.black,
                              letterSpacing: 2.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: height / 40,
                            width: width / 2,
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: height/40,),

                          tercih_card(height, Icons.school, "Bölüm: " +user.currentUser.department),
                          SizedBox(height: height/300,),

                          tercih_card(height, Icons.accessibility_new,"Komite: " + user.currentUser.committee ),
                          SizedBox(height: height/100,),
                          // tercih_card(
                          //   height,
                          //   Icons.notification_important,
                          //   "Computer Society Bildirimleri \n Elk müh bildirimleri \n Comsoc Bildirimleri \n Genel Okul Duyuruları",
                          // ),
                          SizedBox(
                            width: width/3,
                            height: height/20,
                            child: ElevatedButton(
                              onPressed: () {
                                user.currentUser.logout();

                                Fluttertoast.showToast(
                                  msg: "Çıkış işlemlerin başarılı bir şekilde yapıldı!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.amber,
                                  textColor: Colors.white,
                                  fontSize: 10.0,
                                );

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const main_page()),
                                );
                              },
                              child: Text(
                                "Çıkış Yap",
                                style: TextStyle(fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey, // background color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20), // border radius
                                ),
                              ),
                            ),
                          ),


                        ],
                      )

                      // LOG OUT EKLENECEK


                    ],
                  ),

                ),
                CustomPaint(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/20,
                  ),
                  painter: HeaderCurvedContainer(),
                ),
              ],
            ),


          ],
        ));
  }
}
class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.amberAccent;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 4, 400, size.width, 300)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [

        SizedBox(
          width: size.width/0.8,
          //width: double.infinity,
          height: size.height * 0.3,
          child: Image.asset('lib/assets/images/profile_back.png'),
        ),
      ],
    );
  }
}