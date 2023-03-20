import 'package:flutter/material.dart';



// BU VERİLER DATABASEDEN GÜNCELLENECEK
var pp_link = "https://via.placeholder.com/150";
var galeri1 = "https://via.placeholder.com/150";
var galeri2 = "https://via.placeholder.com/150";
var galeri3 = "https://via.placeholder.com/150";
var galeri4 = "https://via.placeholder.com/150";
var isim = "Melih Tumur";
var posta = "melihtumur@ieeegtu.con";
var tel = "05392613502";
var bolum = "Elektronik Mühendisliği";
var aboutCommite = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
var etkinlik1 = "Mobiletech";
var etkinlik2 = "HelloWorld";
var etkinlik3 = "LetMeCode";
var etkinlik4 = "Etkinlik4";
// BU VERİLER DATABASEDEN GÜNCELLENECEK

class eac extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add_circle_outline_rounded) ,backgroundColor: Colors.indigo),
      // FLOAT BUTTON , ADMİNE GÖZÜKECEK , PANELE GİDECEK
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 70,
                          child: CircleAvatar(
                            radius: 67,
                            backgroundImage: NetworkImage(
                              pp_link,
                            ),
                          ),

                        ),
                        Text(
                          'EAC Başkanı',
                          textAlign:TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff00609c),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: 8),
                        Text(
                          isim,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          posta,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          tel,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          bolum,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Divider( thickness: 5,color: Colors.black, ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Komite Hakkında',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    aboutCommite,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Popüler Etkinlikler',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${etkinlik1} \n${etkinlik2}  \n${etkinlik3}  \n${etkinlik4} ',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),

                ],
              ),
            ),
            // Divider(),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Galeri',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(right: 8),
                          color: Colors.grey,
                          child: Center(
                            child: Image(image: NetworkImage(galeri1)),
                          ),
                        ),
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(right: 8),
                          color: Colors.grey,
                          child: Center(
                            child: Image(image: NetworkImage(galeri2)),
                          ),
                        ),
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(right: 8),
                          color: Colors.grey,
                          child: Center(
                            child: Image(image: NetworkImage(galeri3)),
                          ),
                        ),
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(right: 8),
                          color: Colors.grey,
                          child: Center(
                            child: Image(image: NetworkImage(galeri4)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
