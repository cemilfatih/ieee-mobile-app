import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/helper/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ieee_mobile_app/helper/user.dart';
import 'package:ieee_mobile_app/constants/photoHero.dart';

class komite_one_page extends StatefulWidget {
  komite_one_page({Key? key}) : super(key: key);

  @override
  _komite_one_pageState createState() => _komite_one_pageState();
}

class _komite_one_pageState extends State<komite_one_page> {
  bool _isLoading = true;

  var pp_link = "https://via.placeholder.com/150";  // GALERİDEN FOTO SEÇER - PAKETİ VAR GALİBA IMAGEPİCKER
  var galeri1 = "https://via.placeholder.com/150"; // GALERİDEN FOTO SEÇER - PAKETİ VAR GALİBA IMAGEPİCKER
  var galeri2 = "https://via.placeholder.com/150";  // GALERİDEN FOTO SEÇER - PAKETİ VAR GALİBA IMAGEPİCKER
  var galeri3 = "https://via.placeholder.com/150";  // GALERİDEN FOTO SEÇER - PAKETİ VAR GALİBA IMAGEPİCKER
  var galeri4 = "https://via.placeholder.com/150";  // GALERİDEN FOTO SEÇER - PAKETİ VAR GALİBA IMAGEPİCKER
  var isim = "isim";
  var posta = "posta";
  var tel = "telNo";
  var bolum = "bolum";
  var aboutCommite = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  var etkinlik1 = "Mobiletech";
  var etkinlik2 = "HelloWorld";
  var etkinlik3 = "LetMeCode";
  var etkinlik4 = "Etkinlik4";
  var title = user.currentUser.committee;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    String komite = "comsoc";
    int komiteTiklanmasi = Helper.komitePage + 1;

    if(komiteTiklanmasi == 1) komite = "cs";
    else if(komiteTiklanmasi == 2) komite = "comsoc";
    else if(komiteTiklanmasi == 3) komite = "eac";
    else if(komiteTiklanmasi == 4) komite = "embs";
    else if(komiteTiklanmasi == 5) komite = "externalrelations";
    else if(komiteTiklanmasi == 6) komite = "girisimcilik";
    else if(komiteTiklanmasi == 7) komite = "ik";
    else if(komiteTiklanmasi == 8) komite = "kariyer";
    else if(komiteTiklanmasi == 9) komite = "malzeme";
    else if(komiteTiklanmasi == 10) komite = "mat";
    else if(komiteTiklanmasi == 11) komite = "medya";
    else if(komiteTiklanmasi == 12) komite = "pes";
    else if(komiteTiklanmasi == 13) komite = "ras";
    else komite = "wie";


    title = komite;

    await FirebaseFirestore.instance
        .collection('komiteler')
        .doc(komite)
        .get()
        .then((value) {
            isim = value["isim"];
            posta =  value["posta"];
            tel = value["telephone"];
            bolum = value["bolum"];
            aboutCommite = value["about"];
            etkinlik1 = value["e1"];
            etkinlik2 = value["e2"];
            etkinlik3 = value["e3"];
            etkinlik4 = value["e4"];
            galeri1 = value["e1img"];
            galeri2 = value["e2img"];
            galeri3 = value["e3img"];
            galeri4 = value["e4img"];
            setState(() {
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
          
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 70,
                              child: CircleAvatar(
                                radius: 67,
                                backgroundImage: NetworkImage(
                                  pp_link,
                                ),
                              ),

                            ),
                            Text(
                              title,
                              textAlign:TextAlign.center,
                              style: TextStyle(
                                color: Color(0xff00609c),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(height: 8),
                            Text(
                              isim,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              posta,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              tel,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              bolum,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Divider( thickness: 5,color: Colors.black, ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Komite Hakkında',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        aboutCommite,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Popüler Etkinlikler',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${etkinlik1} \n${etkinlik2}  \n${etkinlik3}  \n${etkinlik4} ',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 1),

                    ],
                  ),
                ),
                // Divider(),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Galeri',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 240,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              width: 192,
                              margin: EdgeInsets.only(right: 8),
                              color: Colors.grey,
                              child: Center(
                                child: HeroImage(imageUrl: galeri1),
                              ),
                            ),
                            Container(
                              width: 192,
                              margin: EdgeInsets.only(right: 8),
                              color: Colors.grey,
                              child: Center(
                                child: HeroImage(imageUrl: galeri2),
                              ),
                            ),
                            Container(
                              width: 192,
                              margin: EdgeInsets.only(right: 8),
                              color: Colors.grey,
                              child: Center(
                                child: HeroImage(imageUrl: galeri3),
                              ),
                            ),
                            Container(
                              width: 192,
                              margin: EdgeInsets.only(right: 8),
                              color: Colors.grey,
                              child: Center(
                                child: HeroImage(imageUrl: galeri4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}