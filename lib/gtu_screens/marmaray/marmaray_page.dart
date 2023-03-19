import 'package:flutter/material.dart';
import 'marmarary_const.dart';

class marmaray_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return  Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/images/subw33.png" ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height/5,child: Text("Veriler Marmaray sitesinden sabit olarak alınmıştır.",style: TextStyle(color: Colors.white , fontStyle: FontStyle.italic),)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column( mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(height: height/9, width: width/2.2,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [  Color(0xffbb594e),
                                        Color(0xff8c3d5a),]),
                                      //   color:Color(0x99FFFFFF),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Gebze Yönü\n ${kacDkKaldi(gebze_saatler).toString()} dk",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 25, color: Colors.white , fontWeight: FontWeight.bold)),
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(height: 300,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [  Color(0xffbb594e),
                                      Color(0xff8c3d5a),]),
                                    //color: Color(0x50FFFFFF),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                                child: ListView.builder(
                                  itemCount: halkali_saatler.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text(gebze_saatler[index],textAlign: TextAlign.center ,style: TextStyle(fontSize: 20,color: Colors.white)),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column( mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(height: height/9 , width: width/2.2,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [  Color(0xff3f6bae),
                                        Color(0xff75b4f1),]),
                                      //  color: Color(0xff619de3),
                                      //  border: Border.all(color: Colors.white , width: 5),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Halkalı Yönü\n ${kacDkKaldi(halkali_saatler).toString()} dk",
                                          textAlign: TextAlign.center,
                                          style: TextStyle( color: Colors.white,
                                              fontSize: 25, fontWeight: FontWeight.bold)),
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(height: 300,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [  Color(0xff3f6bae),
                                      Color(0xff75b4f1),]),
                                    //color: Color(0x99FFFFFF),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                                child: ListView.builder(
                                  itemCount: halkali_saatler.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ListTile(
                                      title: Text(halkali_saatler[index],textAlign: TextAlign.center ,style: TextStyle(fontSize: 20 ,color: Colors.white))
                                      ,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
