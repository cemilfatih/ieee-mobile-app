import 'package:flutter/material.dart';



class btg extends StatefulWidget {
  const btg({super.key});

  @override
  State<btg> createState() => _btgState();
}

class _btgState extends State<btg> {
  late PageController _pageController;

  @override

  void _onScroll(){

  }

  void initState(){
    _pageController=PageController(
      initialPage: 0,

    )..addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: PageView(scrollDirection: Axis.vertical,
          controller: _pageController,
          children: [
            PageView(
              children: [
                makePage(1,'lib/assets/images/btg_images/nedir1.png', '', '' ),
                makePage(2,'lib/assets/images/btg_images/nedir2.png', '', '' ),
                makePage(3,'lib/assets/images/btg_images/nedir3.png', '', ''),
                makePage(4,'lib/assets/images/btg_images/nedir4.png', '', ''),
                makePage(5,'lib/assets/images/btg_images/nedir5.png', '', ''),
                makePage(6,'lib/assets/images/btg_images/nedir6.png', '', ''),
                makePage(7,'lib/assets/images/btg_images/nedir7.png', '', ''),
                makePage(8,'lib/assets/images/btg_images/nedir8.png', '', ''),
                makePage(9,'lib/assets/images/btg_images/nedir9.png', '', ''),
              ],
            ),
            PageView(
              children: [
                makePage(1,'lib/assets/images/btg_images/neden1.png', '', '' ),
                makePage(2,'lib/assets/images/btg_images/neden2.png', '', '' ),
                makePage(3,'lib/assets/images/btg_images/neden3.png', '', ''),
                makePage(4,'lib/assets/images/btg_images/neden4.png', '', ''),
                makePage(5,'lib/assets/images/btg_images/neden5.png', '', ''),
              ],
            ),
            PageView(
              children: [
                makePage(1,'lib/assets/images/btg_images/hedef1.png', '', '' ),
                makePage(2,'lib/assets/images/btg_images/hedef2.png', '', '' ),
                makePage(3,'lib/assets/images/btg_images/hedef3.png', '', ''),
                makePage(4,'lib/assets/images/btg_images/hedef4.png', '', ''),
                makePage(5,'lib/assets/images/btg_images/hedef5.png', '', ''),
              ],
            ),

          ],
        ),
      ),
    );
  }
}


Widget makePage(int page, String assetName, String title, String description) {
  final int totalPage = 10;
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(assetName),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          stops: [0.3, 0.9],
          colors: [
            Colors.black.withOpacity(.1),
            Colors.black.withOpacity(.1),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,

              textBaseline: TextBaseline.alphabetic,
              children: [
                Column(
                  children: [
                    Icon(Icons.swipe_down , color: Colors.white,size: 20,),
                  ],
                ),
               Icon(Icons.swipe,color: Colors.white,size: 20,),
                // Text(
                //   page.toString(),
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 30,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // Text(
                //   '',textAlign: TextAlign.end,
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 10,
                //     fontWeight: FontWeight.bold,
                //   ),
                // )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      description,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

