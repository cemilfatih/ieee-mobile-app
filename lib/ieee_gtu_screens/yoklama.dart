import 'package:flutter/material.dart';
import 'yoklama_panel.dart';
import 'package:ieee_mobile_app/constants/yoklama_button.dart';

void main() {
  runApp(const yoklama());
}

class yoklama extends StatefulWidget {
  const yoklama({super.key});

  @override
  State<yoklama> createState() => _yoklamaState();
}

class _yoklamaState extends State<yoklama> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => yoklama_panel()),
              );
            },
            child: Icon(Icons.add_circle_outline_rounded),
            backgroundColor: Colors.indigo),
        body: Container(
          child:
          yoklama_button( "baslik" , "1.1.2022"),

        ),
      ),
    );
  }
}
