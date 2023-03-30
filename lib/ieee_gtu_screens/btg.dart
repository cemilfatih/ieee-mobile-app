import 'package:flutter/material.dart';



void main() {
  runApp(const btg());
}

class btg extends StatefulWidget {
  const btg({super.key});

  @override
  State<btg> createState() => _btgState();
}

class _btgState extends State<btg> {

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(child :Image(image: AssetImage("lib/assets/images/yakında.png"),)),
      ],
    );
  }
}
