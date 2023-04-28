import "package:flutter/material.dart";
import "package:ieee_mobile_app/helper/user.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:ieee_mobile_app/profile_screens/signupPage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class etkinlik_yoklama_kontrol extends StatefulWidget {
  etkinlik_yoklama_kontrol({Key? key}) : super(key: key);

  @override
  _etkinlik_yoklama_kontrolState createState() => _etkinlik_yoklama_kontrolState();
}

class _etkinlik_yoklama_kontrolState extends State<etkinlik_yoklama_kontrol> {

  final databaseRef = FirebaseFirestore.instance;
  List<String>  katilimcilist1 = [] ;
  List<String>  katilimcilist2 = [] ;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }




  Future<void> loadData() async {
    List<String> yapilanEtkinlikler = [];

    bool _isLoadingFirst = true;
    bool _isLoadingSecond = true;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.currentUser.id)
        .get()
        .then((value){
      List.from(value["yapilanEtkinlikler"]).forEach((element) {
        yapilanEtkinlikler.add(element);
      });
      setState(() {
        _isLoadingFirst = false;
      });
    });

    while(_isLoadingFirst);
    List<String>  katilimcilist1ID = [] ;
    List<String>  katilimcilist2ID = [] ;

    for(int idx = 0; idx < yapilanEtkinlikler.length; idx++){
      await FirebaseFirestore.instance
          .collection('etkinlikler')
          .doc(yapilanEtkinlikler[idx])
          .get()
          .then((value) {
        List.from(value["katilimcilar"]).forEach((element)  {
          if(idx == 0) katilimcilist1ID.add(  element );
          else katilimcilist2ID.add( element );
        });
        if(idx == yapilanEtkinlikler.length - 1){
          setState(() {
            _isLoadingSecond = false;
          });
        }
      });
    }

    if(yapilanEtkinlikler.isEmpty) _isLoadingSecond = false;
    while(_isLoadingSecond);
    _isLoadingSecond = true;

    for(int idx = 0 ; idx < katilimcilist1ID.length; idx++){

      await FirebaseFirestore.instance
          .collection('users')
          .doc(katilimcilist1ID[idx])
          .get()
          .then((value) {
        katilimcilist1.add(value["name"] + " " + value["surname"] + "  " + value["telephone"]);
        if(idx == katilimcilist1ID.length-1){
          setState(() {
            _isLoadingSecond = false;
          });
        }
      });
    }

    if(katilimcilist1ID.length == 0) _isLoadingSecond = false;
    while(_isLoadingSecond);
    _isLoadingSecond = true;

    for(int idx = 0 ; idx < katilimcilist2ID.length; idx++){

      await FirebaseFirestore.instance
          .collection('users')
          .doc(katilimcilist2ID[idx])
          .get()
          .then((value) {
        katilimcilist2.add(value["name"] + " " + value["surname"] + "  " + value["telephone"]);
        if(idx == katilimcilist2ID.length-1){
          setState(() {
            _isLoadingSecond = false;
          });
        }
      });
    }

    if(katilimcilist2ID.length == 0) _isLoadingSecond = false;
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
          //floatingActionButtonLocation: FloatingActionButtonLocation.center,
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,mainAxisSize: MainAxisSize.max,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.red,
                    child: Icon(Icons.download_for_offline_outlined),
                    onPressed: (){
                    createExcelFile(katilimcilist1 , "kırmızı");
                  },),
                  FloatingActionButton(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.download_for_offline_outlined),
                    onPressed: (){
                    createExcelFile(katilimcilist2 , "yeşil");
                  },),
                ],
              ),
            ],
          ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(decoration: BoxDecoration(color: Colors.red),
                  height: MediaQuery.of(context).size.height/3,
                  child: ListView.builder(
                    itemCount: katilimcilist1.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(katilimcilist1[index],textAlign: TextAlign.center ,style: TextStyle(fontSize: 20,color: Colors.black)),
                      );
                    },
                  ),),
                Container(
                  decoration: BoxDecoration(color: Colors.greenAccent),
                  height: MediaQuery.of(context).size.height/3,
                  child: ListView.builder(
                    itemCount: katilimcilist2.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(katilimcilist2[index],textAlign: TextAlign.center ,style: TextStyle(fontSize: 20,color: Colors.black)),
                      );
                    },
                  ),
                ),
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

void createExcelFile(x ,y) async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }

  if (await Permission.storage.request().isGranted) {
    final directory = await getExternalStorageDirectory();
    final file = File('${directory?.path}/katilimci${y}.xlsx');
    // final directory = await getExternalStorageDirectory();
    // final file = File('${directory?.parent.path}/KAYITLAR/katilimci.xlsx');

    var excel = Excel.createExcel();
    var sheet = excel['Sheet1'];

    sheet.cell(CellIndex.indexByString("A1")).value = "İsimler";
    sheet.cell(CellIndex.indexByString("B1")).value = "Numaralar";

    for (var i=2 ; i < x.length ; i++ ){
      sheet.cell(CellIndex.indexByString("A${i}")).value = x[i-2];
    };

    file.writeAsBytesSync(excel.encode()!);
    print("deneme");
  }
}

