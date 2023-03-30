import 'package:flutter/material.dart';



void main() {
  runApp(const akademik_kadro());
}

class akademik_kadro extends StatefulWidget {
  const akademik_kadro({super.key});

  @override
  State<akademik_kadro> createState() => _akademik_kadroState();
}

class _akademik_kadroState extends State<akademik_kadro> {

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(child :Image(image: AssetImage("lib/assets/images/yakında.png"),)),
      ],
    );
  }
}
