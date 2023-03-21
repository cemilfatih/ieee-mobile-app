import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:ieee_mobile_app/constants/duyuru_haber.dart';

class duyurular extends StatefulWidget {
  const duyurular({super.key});

  @override
  State<duyurular> createState() => _duyurularState();
}

class _duyurularState extends State<duyurular> {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Duyuru>> getData() async {
    var res = await http.get(Uri.parse(
        "https://www.gtu.edu.tr/kategori/9/0/display.aspx?languageId=1"));
    final document = parser.parse(res.body);
    var response = document.getElementsByClassName('col-md-9 col-md-push-3');
    List<Duyuru> duyurular = [];
    for (int i = 0; i < 10; i++) {
      duyurular.add(Duyuru(
          baslik: response[0]
              .children[0]
              .children[0]
              .children[i]
              .text
              .toString()
              .trim(),
          link: response[0]
              .children[0]
              .children[0]
              .children[i]
              .children[0]
              .attributes['href']
              .toString()));
    }
    return duyurular;
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<List<Duyuru>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred'),
            );
          } else {
            List<Duyuru> duyurular = snapshot.data!;
            return ListView.builder(
              itemCount: duyurular.length,
              itemBuilder: (context, index) {
                return Card(
                  child: SingleChildScrollView( scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      height: height/10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 10),
                            child: Icon(Icons.announcement , color: Colors.blueGrey),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  duyurular[index].baslik,
                                  style: TextStyle(
                                    fontSize: 16,

                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return WebView(
                                          initialUrl: duyurular[index].link,
                                          javascriptMode: JavascriptMode.unrestricted,
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    duyurular[index].link,
                                    style: TextStyle(fontSize: 10, color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
