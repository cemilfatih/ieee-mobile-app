import 'package:flutter/material.dart';
import 'yoklama_panel.dart';
import 'package:ieee_mobile_app/constants/yoklama_button.dart';
import 'package:ieee_mobile_app/helper/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class yoklama extends StatefulWidget {
  yoklama({Key? key}) : super(key: key);

  @override
  _yoklamaState createState() => _yoklamaState();
}

class _yoklamaState extends State<yoklama> {
  bool _isLoading = true;
  bool toplanti = false;
  String tarih = "";
  String sifre = "";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    if(user.currentUser.id == "-1") _isLoading = false;
    else{
      await FirebaseFirestore.instance
          .collection('komiteler')
          .doc(user.currentUser.committee)
          .get()
          .then((value) {
        if(value["toplantı"] == "1") {
          toplanti = true;
          tarih = value["toplantıTarihi"];
          sifre = value["toplantıSifresi"];
        }
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
        ? Center(
        child: CircularProgressIndicator(),
    )
        : SafeArea(
    child: Scaffold(
        floatingActionButton:  Visibility(
          visible: user.currentUser.level > 1 ? true : false,
          child :  FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => yoklama_panel()),
              );
            },
            child: Icon(Icons.add_circle_outline_rounded),
            backgroundColor: Colors.indigo),
        ),
        body: SingleChildScrollView(
          child: Column( mainAxisSize: MainAxisSize.max,
            children: [
              Visibility (
                visible: toplanti ? true : false,
                child: yoklama_button( sifre , tarih),),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
