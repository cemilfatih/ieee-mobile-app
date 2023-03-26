import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

import 'const.dart';

class TablePage extends StatefulWidget {
  final int busIndex;

  TablePage({required this.busIndex});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  void initState() {
    super.initState();
    _fetchHTMLContent();
  }

  List<String> _table1 = [];
  List<String> _table2 = [];

  /** şuan bunlar her otobüs sayfasına basıldığı zaman dolduruluyor ama biz günlük olarak webden çekeceğimiz için bunları her otobüs için ayrı ayrı
      storelamamız lazım yani _table490 _table530 _table559 gibi ayrı ayrı  _table1 birinci kalkış noktası _table2 ikinci kalkış noktası **/

  dynamic stringElement;
  dynamic tableSize;

  /// !!! şuan tabloları otobüs sayfasına basıldıktan sonra çektiğimiz için bi sayfaya girdikten sonra chrome sayfasını yenileyip tekrar aynı sayfaya girince tablolar geliyor

  Future<void> _fetchHTMLContent() async {
    /// bu fonksiyon günde bi kere yapılması gereken fonksiyon ben şuanlık hangi otobüsün sayfasına tıkladıysam onun saatlerini çekiyor
    ///   ama bunu her otobüs için günde 1 kere yapıp depolamalıyız
    if (_table1.isNotEmpty || _table2.isNotEmpty) return;
    final response = await http.get(Uri.parse(busLinks[widget.busIndex]));
    final document = parser.parse(response.body);
    tableSize = document
        .getElementsByClassName("tab-pane fade in active")[0]
        .children[0]
        .children[1]
        .children[1]
        .children[1]
        .querySelector("tr:last-child")
        ?.children[0]
        .children[0]
        .firstChild
        .toString();
    for (int i = 0; (i).toString() != tableSize.replaceAll("\"", ""); i++) {
      stringElement = document
          .getElementsByClassName("tab-pane fade in active")[0]
          .children[0]
          .children[1]
          .children[1]
          .children[1]
          .children[i] // 0, 1, 2, to get to the next
          .children[1]
          .children[0]
          .firstChild
          .toString();
      if (stringElement != "null" &&
          _table1.length.toString() != tableSize.replaceAll("\"", "") &&
          i.toString() == _table1.length.toString())
        _table1.add(stringElement!);
    }
    tableSize = document
        .getElementsByClassName("tab-pane fade in active")[0]
        .children[0]
        .children[2]
        .children[1]
        .children[1]
        .querySelector("tr:last-child")
        ?.children[0]
        .children[0]
        .firstChild
        .toString();
    for (int i = 0; (i).toString() != tableSize.replaceAll("\"", ""); i++) {
      stringElement = document
          .getElementsByClassName("tab-pane fade in active")[0]
          .children[0]
          .children[2]
          .children[1]
          .children[1]
          .children[i] // 0, 1, 2, to get to the next
          .children[1]
          .children[0]
          .firstChild
          .toString();
      if (stringElement != "null" &&
          _table2.length.toString() != tableSize.replaceAll("\"", "") &&
          i.toString() == _table2.length.toString())
        _table2.add(stringElement!);
    }
  }

  int kacDkKaldi(route) {
    DateTime now = DateTime.now();
    DateTime turkishTime = now.toUtc().add(Duration(hours: 3));
    int currentMinuteOfDay = turkishTime.hour * 60 + turkishTime.minute;
    // while (true) {
    for (String trainTime in route) {
      int trainHour = int.parse(trainTime.split('.')[0]);
      int trainMinute = int.parse(trainTime.split('.')[1]);
      int trainMinuteOfDay = trainHour * 60 + trainMinute;

      if (trainMinuteOfDay >= currentMinuteOfDay) {
        return trainMinuteOfDay - currentMinuteOfDay;
      }
    }
    // }
    return -1; // if all train times are in the past, return -1 to indicate an error
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: _fetchHTMLContent(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SafeArea(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
               // backgroundColor: Colors.grey.shade400,
                body: Container(width: double.infinity , height: double.infinity ,color: Color(0xffffe9d4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 50, right: 6, left: 6, bottom: 8),
                        width: width/1.2,
                        height: height/7,
                        decoration: BoxDecoration(
                          color: Color(0xFF00609c),
                          borderRadius: BorderRadiusDirectional.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              ' ${busNums[widget.busIndex]} \n ${busNames[widget.busIndex]} ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: height/40,
                              ),
                              textAlign: TextAlign.center),
                        ),

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
                            margin:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            width: width/2.5,
                            height: height/21,
                            decoration: BoxDecoration(
                              color: Color(0xFFbe1238),
                              borderRadius:
                              BorderRadiusDirectional.circular(15.0),
                            ),
                            child: Text('Fatih Durağına Gidiş',
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
                            margin:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            width: width/2.5,
                            height: height/21,
                            decoration: BoxDecoration(
                              color: Color(0xFFbe1238),
                              borderRadius:
                              BorderRadiusDirectional.circular(15.0),
                            ),
                            child: Text('Fatih Durağından Kalkış',
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
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            width: width/2.5,
                            height: height/2.1,
                            decoration: BoxDecoration(
                                color: Color(0xFFFFF3E0),
                                borderRadius:
                                BorderRadiusDirectional.circular(20.0)),
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: GridView.count(
                              controller: ScrollController(),
                              crossAxisCount: 1,
                              childAspectRatio: 4,
                              children: _table1.map((item) {
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
                            margin:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 5),
                            width: width/2.5,
                            height: height/2.1,
                            decoration: BoxDecoration(
                                color: Color(0xFFFFF3E0),
                                borderRadius:
                                BorderRadiusDirectional.circular(20.0)),
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: GridView.count(
                              controller: ScrollController(),
                              crossAxisCount: 1,
                              childAspectRatio: 4,
                              children: _table2.map((item) {
                                return Container(
                                    child: Text(
                                      item.replaceAll("\"", ""),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 25),
                                    ));
                              }).toList(),
                            ),
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                      Container( height: height/5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("lib/assets/images/bus_back.png" ),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
