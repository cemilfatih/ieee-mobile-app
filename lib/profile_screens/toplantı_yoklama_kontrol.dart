import "package:flutter/material.dart";
import "package:ieee_mobile_app/helper/user.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';



class toplanti_yoklama_kontrol extends StatefulWidget {
  toplanti_yoklama_kontrol({Key? key}) : super(key: key);

  @override
  _toplanti_yoklama_kontrolState createState() => _toplanti_yoklama_kontrolState();
}

class _toplanti_yoklama_kontrolState extends State<toplanti_yoklama_kontrol> {

  final databaseRef = FirebaseFirestore.instance;
  List<String> uyeList = [] ;


  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    bool _isLoadingSecond = true;
    List<String> idList = [] ;

    await FirebaseFirestore.instance
        .collection('komiteler')
        .doc(user.currentUser.committee)
        .get()
        .then((value) {
          if(value["toplantıyaKatılanlar"] == []) _isLoadingSecond = false;
      List.from(value["toplantıyaKatılanlar"]).forEach((element)  async {
        idList.add( element );
      });
      setState(() {
        _isLoadingSecond = false;
      });
    });

    while(_isLoadingSecond);
    _isLoadingSecond = true;

    for(int idx = 0 ; idx < idList.length; idx++){

      await FirebaseFirestore.instance
          .collection('users')
          .doc(idList[idx])
          .get()
          .then((value) {
            uyeList.add(value["name"] + " " + value["surname"] + "  " + value["telephone"]);
            if(idx == idList.length-1){
              setState(() {
                _isLoadingSecond = false;
              });
            }
      });
    }

    if(idList.length == 0) _isLoadingSecond = false;
    while(_isLoadingSecond);
    _isLoading = false;

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
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(decoration: BoxDecoration(color: Colors.red),
                  height: MediaQuery.of(context).size.height/3,
                  child: ListView.builder(
                    itemCount: uyeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(uyeList[index],textAlign: TextAlign.center ,style: TextStyle(fontSize: 20,color: Colors.black)),
                      );
                    },
                  ),),

                // tercih_card(height, Icons.school, user.currentUser.department ),
                // tercih_card(
                //   height,
                //   Icons.notification_important,
                //   "Computer Society Bildirimleri \n Elk müh bildirimleri \n Comsoc Bildirimleri \n Genel Okul Duyuruları",
                // ),
              ],
            )),
      ),
    );
  }
}


