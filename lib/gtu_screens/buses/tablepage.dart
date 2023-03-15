import 'const.dart';
import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  final int busIndex;

  TablePage({required this.busIndex});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  /** şuan bunlar her otobüs sayfasına basıldığı zaman dolduruluyor ama biz günlük olarak webden çekeceğimiz için bunları her otobüs için ayrı ayrı
      storelamamız lazım yani _table490 _table530 _table559 gibi ayrı ayrı  _table1 birinci kalkış noktası _table2 ikinci kalkış noktası **/

  /// !!! şuan tabloları otobüs sayfasına basıldıktan sonra çektiğimiz için bi sayfaya girdikten sonra chrome sayfasını yenileyip tekrar aynı sayfaya girince tablolar geliyor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade400,
        body: SafeArea(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, right: 6, left: 6, bottom: 8),
                  width: 360,
                  height: 125,
                  decoration: BoxDecoration(
                    color: Color(0xFF00609c),
                    borderRadius: BorderRadiusDirectional.circular(20.0),
                  ),
                  child: Text(
                      'Gebze Teknik Üniversitesi-Fatih durağından kalkmasına X dakika kaldı',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center),

                  //color: Colors.white,
                  alignment: Alignment.center,
                ),
                //SizedBox(
                // height: 10,
                //),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                      width: 160,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFbe1238),
                        borderRadius: BorderRadiusDirectional.circular(15.0),
                      ),
                      child: Text('Varış: Fatih Durağı',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center),
                      //color: Colors.white,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                      width: 160,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFbe1238),
                        borderRadius: BorderRadiusDirectional.circular(15.0),
                      ),
                      child: Text('Kalkış: Fatih Durağı',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center),
                      //color: Colors.white,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                      width: 160,
                      height: 400,
                      decoration: BoxDecoration(
                          color: Color(0xFFFFF3E0),
                          borderRadius: BorderRadiusDirectional.circular(20.0)),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: GridView.count(
                        controller: ScrollController(),
                        crossAxisCount: 1,
                        childAspectRatio: 4,
                        children: busTables[widget.busIndex][0].map((item) {
                          return Container(
                            child: Text(
                              item.replaceAll("\"", ""),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25),
                            ),
                          );
                        }).toList(),

                      ),
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                      width: 160,
                      height: 400,
                      decoration: BoxDecoration(
                          color: Color(0xFFFFF3E0),
                          borderRadius: BorderRadiusDirectional.circular(20.0)),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: GridView.count(
                        controller: ScrollController(),
                        crossAxisCount: 1,
                        childAspectRatio: 4,
                        children: busTables[widget.busIndex][1].map((item) {
                          return Container(
                            child: Text(
                              item.replaceAll("\"", ""),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25),
                            ),
                          );
                        }).toList(),
                      ),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
