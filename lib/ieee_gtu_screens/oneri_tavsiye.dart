import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TavsiyeOneriSayfa extends StatefulWidget {
  const TavsiyeOneriSayfa({Key? key}) : super(key: key);

  @override
  State<TavsiyeOneriSayfa> createState() => _TavsiyeOneriSayfaState();
}

class _TavsiyeOneriSayfaState extends State<TavsiyeOneriSayfa> {
  final TextEditingController _fikirController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomPaint(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              painter: HeaderCurvedContainer(),
            ),
            PageHeader(),

            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height:MediaQuery.of(context).size.height/3 ,),
                    Text("Fikirleriniz bizim için önemli. Uygulamamızın gelişmesi için geri dönüşlerinizi bekliyoruz :)", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    TextField(
                      controller: _fikirController,
                      decoration: InputDecoration(
                          hintText: 'Bir fikir veya öneri paylaşın...'),
                      maxLines: 6,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/100),
                    SizedBox(
                      width:  MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/20 ,
                      child: ElevatedButton(
                        child: Text('Gönder' ,style: TextStyle(fontSize: 20),),
                        onPressed: () {
                          String text = "Lütfen en az 10 Karakter giriniz!";
                          if(_fikirController.text.length > 10) {
                            FirebaseFirestore firestore = FirebaseFirestore
                                .instance;
                            List<dynamic> l = [_fikirController.text];

                            firestore.collection("oneriler")
                                .doc("oneri")
                                .update({"oneriler": FieldValue.arrayUnion(l)});
                            text = "Oneriniz başarıyla alındı teşekkürler!";
                          }
                          Fluttertoast.showToast(
                              msg: text,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.amber,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );

                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent, // background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // border radius
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blueAccent;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 4, 200, size.width, 300)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [

        SizedBox(
          width: size.width/0.8,
          //width: double.infinity,
          height: size.height * 0.3,
          child: Image.asset('lib/assets/images/advice.png'),
        ),
      ],
    );
  }
}