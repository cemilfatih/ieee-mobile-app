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
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ClipRect(
            child: PhotoView(
              backgroundDecoration: BoxDecoration(color: Color(0xff6AA8D9)),
              imageProvider: const AssetImage("lib/assets/images/kampus.jpeg"),
              maxScale: PhotoViewComputedScale.covered * 5.0,
              minScale: PhotoViewComputedScale.contained * 0.8,
              initialScale: PhotoViewComputedScale.covered,
              enableRotation: true,
            ),
          ),
        ));
  }
}


//Color(0xff6AA8D9)