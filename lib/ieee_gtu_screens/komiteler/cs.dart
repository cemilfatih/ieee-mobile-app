import 'package:flutter/material.dart';




var aboutCommite = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";


class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              'https://via.placeholder.com/150',
                            ),
                          ),

                        ),
                        Text(
                          'Computer Society Başkanı',
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
                          'Melih Tumur',

                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'eposta@ornek.com',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Telefon: 555 555 55 55',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Bölüm : Elektronik Mühendisliği',
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
                    'Etkinlik \nEtkinlik \nEtkinlik \nEtkinlik\nEtkinlik',
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
                        Hero(
                          tag : "lib/assets/images/ieee_icon.png",
                          child: Container(
                            width: 100,
                            margin: EdgeInsets.only(right: 8),
                            color: Colors.grey,
                            child: Center(
                              child: Text("ETKİNLİK AFIS / FOTO"),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(right: 8),
                          color: Colors.grey,
                          child: Center(
                            child: Text('ETKİNLİK AFIS / FOTO 2'),
                          ),
                        ),
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(right: 8),
                          color: Colors.grey,
                          child: Center(
                            child: Text('ETKİNLİK AFIS / FOTO 3'),
                          ),
                        ),
                        Container(
                          width: 100,
                          margin: EdgeInsets.only(right: 8),
                          color: Colors.grey,
                          child: Center(
                            child: Text('ETKİNLİK AFIS / FOTO 4'),
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
