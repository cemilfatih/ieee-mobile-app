import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:ieee_mobile_app/constants/duyuru_haber.dart';

class haberler extends StatefulWidget {
  const haberler({super.key});

  @override
  State<haberler> createState() => _haberlerState();
}

class _haberlerState extends State<haberler> {
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

  Future<List<haber_gtu>> getData() async {
    var res = await http.get(Uri.parse(
        'https://www.gtu.edu.tr/kategori/8/0/display.aspx'));
    final document = parser.parse(res.body);
    var response = document.getElementsByClassName( 'col-md-9 col-md-push-3');
    List<haber_gtu> haberler = [];
    for (int i = 0; i < 8; i++) {
      haberler.add(haber_gtu(
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
    return haberler;
  }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<List<haber_gtu>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('An error occurred'),
            );
          } else {
            List<haber_gtu> haberler = snapshot.data!;
            return ListView.builder(
              itemCount: haberler.length,
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
                            child: Icon(Icons.newspaper , color: Colors.blueGrey),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  haberler[index].baslik,
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
                                          initialUrl: haberler[index].link,
                                          javascriptMode: JavascriptMode.unrestricted,
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    haberler[index].link,
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
