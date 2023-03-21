import 'package:flutter/material.dart';



void main() {
  runApp(const panel());
}

class panel extends StatefulWidget {
  const panel({super.key});

  @override
  State<panel> createState() => _panelState();
}

class _panelState extends State<panel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          TextField (
          decoration: InputDecoration(
          border: InputBorder.none,
              labelText: 'BAŞKAN İSMİ',
              hintText: 'Enter Your Name'
          ),),
            TextField (
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'POSTA',
                  hintText: 'Enter Your Name'
              ),),
            TextField (
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'TEL NO',
                  hintText: 'Enter Your Name'
              ),),
            TextField (
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'BOLUM',
                  hintText: 'Enter Your Name'
              ),),
            TextField (
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'KOMİTE HAKKINDA',
                  hintText: 'Enter Your Name'
              ),),
            TextField (
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ETKİNLİK1',
                  hintText: 'Enter Your Name'
              ),),
            TextField (
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ETKİNLİK2',
                  hintText: 'Enter Your Name'
              ),),
            TextField (
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ETKİNLİK3',
                  hintText: 'Enter Your Name'
              ),),
            TextField (
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ETKİNLİK4',
                  hintText: 'Enter Your Name'
              ),),
              TextButton(onPressed:() {
              }, child: Text("pp seç")),
              TextButton(onPressed:() {
              }, child: Text("galeri1")),
              TextButton(onPressed:() {
              }, child: Text("galeri2")),
              TextButton(onPressed:() {
              }, child: Text("galeri3")),
              TextButton(onPressed:() {
              }, child: Text("galeri4")),
              ElevatedButton(onPressed: () {

              }, child: Text("GÖNDER"))

    ],),
        )
    );
  }
}
