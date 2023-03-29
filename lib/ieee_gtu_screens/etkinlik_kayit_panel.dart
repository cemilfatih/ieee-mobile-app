import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/helper/helper.dart';
import "package:ieee_mobile_app/helper/user.dart";
import 'package:cloud_firestore/cloud_firestore.dart';


class etkinlik_kayit_panel extends StatefulWidget {
  etkinlik_kayit_panel({Key? key}) : super(key: key);

  @override
  _etkinlik_kayit_panel_kontrolState createState() => _etkinlik_kayit_panel_kontrolState();
}

class _etkinlik_kayit_panel_kontrolState extends State<etkinlik_kayit_panel> {

  final databaseRef = FirebaseFirestore.instance;
  final nameController = TextEditingController();
  final notController = TextEditingController();
  final dateController = TextEditingController();

  List<String> etkinlikListsi = [] ;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.currentUser.id)
        .get()
        .then((value) {
      List.from(value["yapilanEtkinlikler"]).forEach((element)  {
        etkinlikListsi.add(element);

      });
    });
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(etkinlikListsi.length == 2) {
      return Scaffold(appBar: AppBar(
        title: Text('Uyarı'),

        ),
        body: ListView(
            children: <Widget>[TextField( decoration: InputDecoration(

            labelText: 'Maksimum sayıdaki etkinliğe ulaştın, Lütfen yaptığın etkinlikleri sil!',
        ),
        ),
              Container(decoration: BoxDecoration(color: Colors.red),
                height: MediaQuery.of(context).size.height/3,
                child: ListView.builder(
                  itemCount: etkinlikListsi.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('title'),
                      subtitle: Column(
                        children: <Widget>[
                          TextButton(child: Text(etkinlikListsi[index]), onPressed: () {
                            Helper.etkinlikSil(etkinlikListsi[index]);
                            const SnackBar(content: Text('Etkinlik Kaldırıldı!'));
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  etkinlik_kayit_panel()),
                            );
                          })
                        ],
                      ),
                    );
                  },
                ),),
            ],

      ),
      );
    }

    return Scaffold(

        body: _isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : SafeArea(
        child:Scaffold(
      appBar: AppBar(
        title: Text('etkinlik_kayit_olusturma_paneli'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          TextField( decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'ETKİNLİK ADI',
              hintText: 'Afişteki Başlık'
          ),
            controller: nameController,
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Etkinlik Hakkında',
                hintText: 'Kısa Bilgi'
            ),
            controller: notController,
          ),
          TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Tarih Giriniz',
                hintText: 'gün-ay-yıl'
            ),
            controller: dateController,
          ),
          ElevatedButton(onPressed: () async{
            await Helper.etkinlik_kayit(nameController.text, notController.text, dateController.text );

          }, child: Text('etkinlik_kayit')),

          ElevatedButton(onPressed: () async{
            if(etkinlikListsi.length == 1) {
              Helper.etkinlikSil(etkinlikListsi[0]);
              const SnackBar(content: Text('Etkinlik Kaldırıldı!'));
            }
          }, child: Text(etkinlikListsi.length == 1 ? "Şuanda bir adet etkinliğin var silmek istiyorsan tıkla!" : "Önemsemeyebilirsin")),
        ],
      )

        ),
        ),
    );
  }
}
