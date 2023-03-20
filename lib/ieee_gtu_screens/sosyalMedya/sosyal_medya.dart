import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/ieee_gtu_screens/sosyalMedya/icerik.dart';




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
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add_circle_outline_rounded) ,backgroundColor: Colors.indigo),
      // FLOAT BUTTON , ADMİNE GÖZÜKECEK , PANELE GİDECEK
      body:imagesScreen()
    );
  }
}
