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
                    labelText: ' 1post baslık',
                    hintText: 'Enter Your Name'
                ),),
              TextField (
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'caption',
                    hintText: 'Enter Your Name'
                ),),
              TextButton(onPressed:() {
              }, child: Text("foto seç")),
              ElevatedButton(onPressed: () {

              }, child: Text("GÖNDER")),
              TextField (
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: ' 2post baslık',
                    hintText: 'Enter Your Name'
                ),),
              TextField (
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'caption',
                    hintText: 'Enter Your Name'
                ),),
              TextButton(onPressed:() {
              }, child: Text("foto seç")),
              ElevatedButton(onPressed: () {

              }, child: Text("GÖNDER")),
              TextField (
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: ' 3post baslık',
                    hintText: 'Enter Your Name'
                ),),
              TextField (
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'caption',
                    hintText: 'Enter Your Name'
                ),),
              TextButton(onPressed:() {
              }, child: Text("foto seç")),
              ElevatedButton(onPressed: () {

              }, child: Text("GÖNDER")),
              TextField (
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: ' 4post baslık',
                    hintText: 'Enter Your Name'
                ),),
              TextField (
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'caption',
                    hintText: 'Enter Your Name'
                ),),
              TextButton(onPressed:() {
              }, child: Text("foto seç")),
              ElevatedButton(onPressed: () {

              }, child: Text("GÖNDER")),
              TextField (
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: ' 5post baslık',
                    hintText: 'Enter Your Name'
                ),),
              TextField (
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'caption',
                    hintText: 'Enter Your Name'
                ),),
              TextButton(onPressed:() {
              }, child: Text("foto seç")),
              ElevatedButton(onPressed: () {

              }, child: Text("GÖNDER"))

            ],),
        )
    );
  }
}
