import 'package:flutter/material.dart';



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
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add_circle_outline_rounded) ,backgroundColor: Colors.indigo),
        // YOKLAMA AÇMA SAYFASINA GİDER
        body: Container(child :Text("yoklama")));
  }
}
