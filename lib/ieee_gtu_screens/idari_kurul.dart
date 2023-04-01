import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ieee_mobile_app/constants/duyuru_haber.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

class idari_kurul extends StatelessWidget {
  const idari_kurul({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: imagesScreen(),
    );
  }
}

class imagesScreen extends StatefulWidget {
  const imagesScreen({Key? key}) : super(key: key);

  @override
  State<imagesScreen> createState() => _imagesScreenState();
}

class _imagesScreenState extends State<imagesScreen> {

  final PageController _pageController =
  PageController(viewportFraction: 0.8, keepPage: true);



  List<Color> colors =[
    Color(0xffbe1238),
    Color(0xfff5af19),
    Color(0xfff12711),Colors.black,Color(0xfff5af19),
  ];
  List<Photo> fotolar = [];
  Future getData() async {
    var res = await http.get(Uri.parse('https://ieeegtu.com/idarikurul/'));
    final document = parser.parse(res.body);
    var response = document.getElementsByClassName('row main_content');
    var link;
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 3; j++) {
        link = response[0]
            .getElementsByClassName('panel-layout')[0]
            .children[i]
            .children[j]
            .children[0]
            .children[0]
            .attributes["src"];
        if (link != null) {
          fotolar.add(Photo(link: link));
        }
      }
    }
    for (int i = 0; i < 14; i++) {
      print(fotolar[i].link);
    }}


  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;




    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          return ListView(
            children: [
              SizedBox(height: height/50),
              Container(
                height: height / 1.5,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: fotolar.length,
                  itemBuilder: (_, index) => Card(

                    //borderOnForeground: true,
                    //shadowColor: colors[index],
                    //elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: height / 1.8,
                          margin:  EdgeInsets.all(width/20),
                          decoration: BoxDecoration(
                            // color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: NetworkImage(
                                  fotolar[index].link,
                                ),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox( height : height/30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController, // PageController
                    count: fotolar.length,
                    effect:ScrollingDotsEffect(dotColor: Color(0x4000609c),activeDotColor: Color(0xffbe1238),),
                    onDotClicked: (index) {},
                  ),
                ],
              ),
            ],
          );
        }
      ),
    );
  }
}


