import 'package:flutter/material.dart';



void main() {
  runApp(const akademik_takvim());
}

class akademik_takvim extends StatefulWidget {
  const akademik_takvim({super.key});

  @override
  State<akademik_takvim> createState() => _akademik_takvimState();
}

class _akademik_takvimState extends State<akademik_takvim> {

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(child :Image(image: AssetImage("lib/assets/images/yakında.png"),)),
      ],
    );
  }
}
