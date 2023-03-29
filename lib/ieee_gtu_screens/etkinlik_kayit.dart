import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ieee_mobile_app/helper/helper.dart';
import "package:ieee_mobile_app/ieee_gtu_screens/etkinlik_kayit_panel.dart";
import 'package:ieee_mobile_app/constants/kayit_button.dart';
import 'package:ieee_mobile_app/helper/user.dart';

class etkinlik_kayit extends StatefulWidget {
  etkinlik_kayit({Key? key}) : super(key: key);


  @override
  _etkinlik_kayitState createState() => _etkinlik_kayitState();
}

class _etkinlik_kayitState extends State<etkinlik_kayit> {
  final databaseRef = FirebaseFirestore.instance;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    Helper.etkinlikSayisi = 0;
    Helper.etkinlikler = [];

    List<String> tempEtkinlik = [];

    await FirebaseFirestore.instance
        .collection('etkinlikler')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        tempEtkinlik = [];
        tempEtkinlik.add(doc["ad"] ?? "");
        tempEtkinlik.add(doc["tarih"] ?? "");
        tempEtkinlik.add(doc["not"] ?? "");
        tempEtkinlik.add(doc["id"] ?? "");
        tempEtkinlik.add(doc["komite"] ?? "");
        Helper.etkinlikler.add(tempEtkinlik);
        Helper.etkinlikSayisi++;
      });
      setState(() {
        // Update state variables here
        // For example:
        _isLoading = false;
      });
    });
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
              floatingActionButton: Visibility(
                  visible: user.currentUser.level > 1,
                  child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => etkinlik_kayit_panel()),
                        );
                      },
                      child: Icon(Icons.add_circle_outline_rounded),
                      backgroundColor: Colors.indigo)),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                  children: [
                    for (int x = 0; x < Helper.etkinlikSayisi; x++) ...[
                      Container(width: double.infinity,
                        child: kayit_button(
                            Helper.etkinlikler[x][2],
                            Helper.etkinlikler[x][0],
                            Helper.etkinlikler[x][1],
                            Helper.etkinlikler[x][3]),
                      ),
                    ],
                  ],
                ),
              )),
        ),
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/helper/helper.dart';
import "etkinlik_kayit_panel.dart";
import 'package:ieee_mobile_app/constants/kayit_button.dart';
import 'package:ieee_mobile_app/helper/user.dart';

void main() {
  user.currentUser.level;
  runApp(const etkinlik_kayit());
}

class etkinlik_kayit extends StatefulWidget {
  const etkinlik_kayit({super.key});

  @override
  State<etkinlik_kayit> createState() => _etkinlik_kayitState();
}

class _etkinlik_kayitState extends State<etkinlik_kayit> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: Visibility(
              visible: user.currentUser.level > 1,
              child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => etkinlik_kayit_panel()),
                    );
                  },
                  child: Icon(Icons.add_circle_outline_rounded),
                  backgroundColor: Colors.indigo)),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,mainAxisSize: MainAxisSize.max,
              children: [
                for (int x = 0; x < Helper.etkinlikSayisi; x++) ...[
                  Container(width: double.infinity,
                    child: kayit_button(
                        Helper.etkinlikler[x][2],
                        Helper.etkinlikler[x][0],
                        Helper.etkinlikler[x][1],
                        Helper.etkinlikler[x][3]),
                  ),
                ],
              ],
            ),
          )),
    );
  }
}
*/