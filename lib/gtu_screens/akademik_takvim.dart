import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';




class akademik_takvim extends StatefulWidget {
  const akademik_takvim({super.key});

  @override
  State<akademik_takvim> createState() => _akademik_takvimState();
}

class _akademik_takvimState extends State<akademik_takvim> {




  @override
  Widget build(BuildContext context) {
    return Container(child: Image(image: AssetImage("lib/assets/images/yakında.png"),) ,);
  }
}












