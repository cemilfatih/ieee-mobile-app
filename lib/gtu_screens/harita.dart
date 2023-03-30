import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class harita extends StatefulWidget {
  const harita({super.key});

  @override
  State<harita> createState() => _haritaState();
}

class _haritaState extends State<harita> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(color: Color(0xff6AA8D9)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SafeArea(
                child: Container(
                    height: height / 1.5,
                    width: width / 1.3,
                    child: PhotoView(
                      backgroundDecoration:
                          BoxDecoration(color: Color(0xff6AA8D9)),
                      imageProvider: AssetImage("lib/assets/images/kampus.jpeg"),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
