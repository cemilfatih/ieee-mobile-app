import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final String imageUrl;
  // final double height;
  // final double width;

  const HeroImage({required this.imageUrl,
   // this.height = 200,
    //this.width = 200,
  });

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) {
              return Scaffold(
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                floatingActionButton: FloatingActionButton( backgroundColor: Colors.black,onPressed:() {
                  Navigator.pop(context);

                },
                  child : Icon(Icons.arrow_back),
                ),
                body: SizedBox.expand(
                  child: Hero(
                    tag: imageUrl,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
      child: Hero(
        tag: imageUrl,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          height: Height,
          width: Width,
        ),
      ),
    );
  }
}
