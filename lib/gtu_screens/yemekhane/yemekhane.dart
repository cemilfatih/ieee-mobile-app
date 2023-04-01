import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/gtu_screens/yemekhane/fortry.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:photo_view/photo_view.dart';

class yemekhane extends StatefulWidget {
  const yemekhane({Key? key}) : super(key: key);

  @override
  State<yemekhane> createState() => _yemekhaneState();
}

class _yemekhaneState extends State<yemekhane> {
  String? imageUrl;

  Future<void> fetchData() async {
    final url = Uri.parse('https://www.gtu.edu.tr/kategori/2589/0/display.aspx');
    final response = await http.get(url);
    final body = response.body;
    final document = parser.parse(body);
    final responseUrl = document
        .getElementsByClassName('col-md-9 col-md-push-3')
        .elementAt(0)
        .children[1]
        .children[1]
        .attributes['src']
        .toString();
    imageUrl = 'https://www.gtu.edu.tr' + Uri.encodeFull(responseUrl).toString();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox( quarterTurns: 1,
      child: Container(color: Colors.white,
        child: PhotoView(backgroundDecoration: BoxDecoration(color: Colors.white) ,imageProvider: NetworkImage(imageUrl!) ,)
        //Image.network(imageUrl!)
      ),
    );
  }
}
