import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class sosyal_icerik extends StatelessWidget {
  const sosyal_icerik({Key? key}) : super(key: key);

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
    "https://pbs.twimg.com/media/FqXjJfrWIAEZStv?format=jpg&name=large",
    "https://pbs.twimg.com/media/EY9MbM4XQAAhSoJ?format=jpg&name=large",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBzWzTv9oLcXuakSngUrGYXA6lLDO32cbdPuzKWBZXH6ln4aZij9evSZGm5c0XV5XmMwk&usqp=CAU",
    "https://pbs.twimg.com/media/FqC-v0BXgAcWhqv?format=jpg&name=large",
    "https://www.gtu.edu.tr/Files/etkinlikler/2019/nisan/Poster.jpg",
  ];
 // DATABASEDEN GÜNCELlENECEK


  List<String> texts = [
    "Okulumuz Şehir ve Bölge Planlama Bölüm Başkanı Doç. Dr. Tayfun Salihoğlu ile 10 Mart Cuma günü saat 20.30’da 'Kentlerin Depreme Dayanıklılığı' konusuyla YouTube'da canlı yayındayız.longText longText longText longText longText longText longText longText longText longText longText longText longText longText longText ",
    "Okulumuz Şehir ve Bölge Planlama Bölüm Başkanı Doç. Dr. Tayfun Salihoğlu ile 10 Mart Cuma günü saat 20.30’da 'Kentlerin Depreme Dayanıklılığı' konusuyla YouTube'da canlı yayındayız.",
    "Okulumuz Şehir ve Bölge Planlama Bölüm Başkanı Doç. Dr. Tayfun Salihoğlu ile 10 Mart Cuma günü saat 20.30’da 'Kentlerin Depreme Dayanıklılığı' konusuyla YouTube'da canlı yayındayız.",
    "Okulumuz Şehir ve Bölge Planlama Bölüm Başkanı Doç. Dr. Tayfun Salihoğlu ile 10 Mart Cuma günü saat 20.30’da 'Kentlerin Depreme Dayanıklılığı' konusuyla YouTube'da canlı yayındayız.",
    "Okulumuz Şehir ve Bölge Planlama Bölüm Başkanı Doç. Dr. Tayfun Salihoğlu ile 10 Mart Cuma günü saat 20.30’da 'Kentlerin Depreme Dayanıklılığı' konusuyla YouTube'da canlı yayındayız."
  ];
  // DATABASEDEN GÜNCELlENECEK

  List<String> baslik = [
    "ETKİNLİK BASLIGI",
    "ETKİNLİK BASLIGI",
    "ETKİNLİK BASLIGI",
    "ETKİNLİK BASLIGI",
    "ETKİNLİK BASLIGI",
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

            height: height / 1.35,
            child: PageView.builder(

              controller: _pageController,
              itemCount: imagesUrl.length,
              itemBuilder: (_, index) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: height / 2.3,

                    margin:  EdgeInsets.all(width/20),
                    decoration: BoxDecoration(
                      // color: Colors.grey,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30) , topRight: Radius.circular(30)),
                      image: DecorationImage(
                          image: NetworkImage(
                            imagesUrl[index],
                          ),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Color(0xff00609c), borderRadius: BorderRadius.only(bottomRight: Radius.circular(30) , bottomLeft: Radius.circular(30)) ),
                    height: height/5,
                    width: width/1.4,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(baslik[index], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white , fontSize: 20)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(texts[index] , style: TextStyle(color: Colors.white) , ),
                          ),
                        ],
                      ),),
                  ),
                ],
              ),
            ),
          ),
         // SizedBox( height : height/30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: _pageController, // PageController
                count: imagesUrl.length,
                effect:ExpandingDotsEffect(dotColor: Color(0x4000609c),activeDotColor: Color(0xffbe1238),),
                onDotClicked: (index) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}