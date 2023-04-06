import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/helper/etkinlik.dart';
import 'package:ieee_mobile_app/helper/helper.dart';
import 'package:ieee_mobile_app/main.dart';

import 'package:ieee_mobile_app/helper/user.dart';
import 'package:fluttertoast/fluttertoast.dart';

class uye_onay_button extends StatefulWidget {
  // Color renk1;
  // Color renk2;
  String id;
  String name;
  String mail ;

  uye_onay_button(this.id, this.name ,this.mail );
  //int get rota => rota ;

  @override
  State<uye_onay_button> createState() => _uye_onay_buttonState();
}
class _uye_onay_buttonState extends State<uye_onay_button> {


  @override
  Widget build(BuildContext context) {
    //var boy= ( MediaQuery.of(context).size.height * 0.18);
    // var ic_boy = ( MediaQuery.of(context).size.height * 0.11);
    var width = (MediaQuery.of(context).size.width);
    var height = (MediaQuery.of(context).size.height);
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        width: width/1.3,
        height: height/7,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                offset: Offset(0,2),
                blurRadius: 6.0
            )
          ],
          gradient: LinearGradient(
            colors: [Color(0xffF00000),
              Color(0xffbe1238),],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(60),//boy*0.28
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 1,
                      child: SizedBox(
                        width: width/1.5,
                        height: height/5,
                        child: Text(widget.id , textAlign: TextAlign.center , style: TextStyle(color: Colors.black),),// ACIKLAMA
                      ),
                    ),
                    Expanded(flex: 2 ,child: Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: height/35,
                            fontWeight: FontWeight.bold , color: Colors.white)
                    ),),
                    Expanded(flex: 1 ,child: Text(
                        widget.mail,
                        style: TextStyle(
                            fontSize: height/50, color: Colors.black
                        )
                    ),),
                  ],
                ),
              ),
              Expanded(flex: 1,
                child: Column( mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SingleChildScrollView(
                      child: ElevatedButton(style: ElevatedButton.styleFrom( minimumSize: Size(height/10, height/10.5) , backgroundColor: Colors.black , shape: CircleBorder()) ,onPressed: () {

                        Helper.userOnay(widget.id) ;
                        Fluttertoast.showToast(
                            msg: "Basariyla kullanıcı onaylandı!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.amber,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(user.currentUser.id != "-1" ? "Onayla" : "Giriş Gerekli", style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold)),
                        ),

                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}