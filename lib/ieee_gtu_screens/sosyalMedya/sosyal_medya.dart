import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/ieee_gtu_screens/sosyalMedya/icerik.dart';
import 'sosyal_medya_panel.dart';
import 'package:ieee_mobile_app/helper/user.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const sosyal_medya());
}

class sosyal_medya extends StatefulWidget {
  const sosyal_medya({super.key});

  @override
  State<sosyal_medya> createState() => _sosyal_medyaState();
}

class _sosyal_medyaState extends State<sosyal_medya> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end , crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          Visibility(
            visible: user.currentUser.level > 1,
            child:  FloatingActionButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => panel()),
            );
          },child: Icon(Icons.add_circle_outline_rounded) ,backgroundColor: Colors.black),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Instagram" , style: TextStyle(color: Color(0xFFE1306C) , fontWeight: FontWeight.bold) ,),
              SizedBox(width: 8,),
              FloatingActionButton( backgroundColor: Color(0xFFE1306C),
                  child: ImageIcon(AssetImage("lib/assets/images/ig_icon.png")),
                  onPressed: ()async{
                final x = "https://www.instagram.com/gtuieee/";
                if(await canLaunchUrlString(x)){
                await launchUrlString(x,mode: LaunchMode.externalApplication);
                }
              }),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Twitter" , style: TextStyle(color: Colors.blue , fontWeight: FontWeight.bold) ,),
              SizedBox(width: 8,),
              FloatingActionButton(
                  child: ImageIcon(AssetImage("lib/assets/images/tw_icon.png")),
                  onPressed: ()async{
                    final x = "https://twitter.com/gtuieee";
                    if(await canLaunchUrlString(x)){
                      await launchUrlString(x,mode: LaunchMode.externalApplication);
                    }
                  }),
            ],
          )

        ],
      ),

        //DEĞİŞKENLER icerik.dart ta
      body:sosyal_icerik()
    );
  }
}
