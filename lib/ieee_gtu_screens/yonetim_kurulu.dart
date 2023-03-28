import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class yonetim_kurulu extends StatelessWidget {
  const yonetim_kurulu({Key? key}) : super(key: key);

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

  List<String> imagesUrl = [
    "https://ieeegtu.com/wp-content/uploads/2022/07/Calisma-Yuzeyi-1-kopya-4.png",
    "https://ieeegtu.com/wp-content/uploads/2022/07/yk-web-1.png",
    "https://ieeegtu.com/wp-content/uploads/2022/07/Varlik-1-1.png",
    "https://ieeegtu.com/wp-content/uploads/2022/07/Calisma-Yuzeyi-1-kopya-2.png",
    "https://ieeegtu.com/wp-content/uploads/2022/07/Calisma-Yuzeyi-1-1.png",
    "https://ieeegtu.com/wp-content/uploads/2022/07/yk-web.png",
  ];
  // DATABASEDEN GÜNCELlENECEK


  List<Color> colors =[
    Color(0xffbe1238),
    Color(0xfff5af19),
    Color(0xfff12711),Colors.black,Color(0xfff5af19),
  ];


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: height/50),
          Container(

            height: height / 1.7,
            child: PageView.builder(

              controller: _pageController,
              itemCount: imagesUrl.length,
              itemBuilder: (_, index) => Card(

                //borderOnForeground: true,
                //shadowColor: colors[index],
                //elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: height / 2,
                      margin:  EdgeInsets.all(width/20),
                      decoration: BoxDecoration(
                        // color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: NetworkImage(
                              imagesUrl[index],
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
                count: imagesUrl.length,
                effect:ScrollingDotsEffect(dotColor: Color(0x4000609c),activeDotColor: Color(0xffbe1238),),
                onDotClicked: (index) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}