import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:photo_view/photo_view.dart';

class yemekhane extends StatefulWidget {
  const yemekhane({Key? key}) : super(key: key);

  @override
  State<yemekhane> createState() => _yemekhaneState();
}

class _yemekhaneState extends State<yemekhane> {
  late String imageUrl;

  Future<void> fetchData() async {
    final url =
    Uri.parse('https://www.gtu.edu.tr/kategori/2589/0/display.aspx');
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
    imageUrl =
        'https://www.gtu.edu.tr' + Uri.encodeFull(responseUrl).toString();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return RotatedBox(
              quarterTurns: 1,
              child: ClipRect(
                child: PhotoView(
                  backgroundDecoration: BoxDecoration(color: Colors.white),
                  imageProvider:  NetworkImage(imageUrl),
                  maxScale: PhotoViewComputedScale.covered * 5.0,
                  minScale: PhotoViewComputedScale.contained * 0.8,
                  initialScale: PhotoViewComputedScale.covered,
                  enableRotation: true,
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
