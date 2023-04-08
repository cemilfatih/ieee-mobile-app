import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class hakkinda extends StatefulWidget {
  const hakkinda({super.key});

  @override
  State<hakkinda> createState() => _hakkindaState();
}

class _hakkindaState extends State<hakkinda> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column( mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.end,children: [Image.asset("lib/assets/images/about_back.png")],),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(child: Column(
            children: [
              Container(child: Text(about , textAlign: TextAlign.center, style: TextStyle(fontSize: 20 ),)    ),
              SizedBox(height: 20,),
              _buildPanel(),
            ],
          )),

        ),
      ],
    );
  }
  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _items[index].isExpanded = !isExpanded;
        });
      },
      children: _items.map<ExpansionPanel>((Item item) {
        return ExpansionPanel( canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue ,  textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 20)),
            );
          },
          body: ListTile(
            title: item.expandedValue,
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

List<Item> _items = <Item>[
  Item(
    headerValue: 'Mobil Uygulama Ekibimiz',
    expandedValue: icerik(),
    isExpanded: false,
  ),
];

class Item {
  String headerValue;
  Widget expandedValue;
  bool isExpanded;

  Item({required this.headerValue, required this.expandedValue, required this.isExpanded});
}





class icerik extends StatelessWidget {
  const icerik({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 10,),
        RichText(textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Melih Tumur ',
                style: TextStyle(fontSize: 21, color: Colors.black),
              ),
              TextSpan(
                text: '\nEkip lideri',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
          ElevatedButton( style: ElevatedButton.styleFrom( minimumSize: Size(30,30) , backgroundColor: Colors.blueAccent ),
            child: Text("in"),
              onPressed: () async{
              final x = "https://www.linkedin.com/in/muhammet-melih-tumur-6069261ba/";
              if(await canLaunchUrlString(x)){
                await launchUrlString(x , mode: LaunchMode.externalApplication);
              }
              }
          ),
        

        SizedBox(height: 10,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Ahmet Yiğit ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nBackend Developer',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            RichText(textAlign: TextAlign.end,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Selen Erdoğan',
                    style: TextStyle(fontSize: 20, color: Colors.black ),

                  ),
                  TextSpan(
                    text: ' \nFrontend Developer',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          ElevatedButton( style: ElevatedButton.styleFrom( minimumSize: Size(30,30) , backgroundColor: Colors.blueAccent ),
              child: Text("in"),
              onPressed: () async{
                final x = "https://www.linkedin.com/in/muhammet-melih-tumur-6069261ba/";
                if(await canLaunchUrlString(x)){
                  await launchUrlString(x,mode: LaunchMode.externalApplication);
                }
              }
          ),
          ElevatedButton( style: ElevatedButton.styleFrom( minimumSize: Size(30,30) , backgroundColor: Colors.blueAccent ),
              child: Text("in"),
              onPressed: () async{
                final x = "https://www.linkedin.com/in/muhammet-melih-tumur-6069261ba/";
                if(await canLaunchUrlString(x)){
                  await launchUrlString(x ,mode: LaunchMode.externalApplication);

                }
              }
          ),
        ],),
        SizedBox(height: 10,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Cemil F. Yol',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nBackend Developer',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            RichText(textAlign: TextAlign.end,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Yusuf E. Nalbant ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nFrontend Developer',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton( style: ElevatedButton.styleFrom( minimumSize: Size(30,30) , backgroundColor: Colors.blueAccent ),
                child: Text("in"),
                onPressed: () async{
                  final x = "https://www.linkedin.com/in/muhammet-melih-tumur-6069261ba/";
                  if(await canLaunchUrlString(x)){
                    await launchUrlString(x , mode: LaunchMode.externalApplication);
                  }
                }
            ),
            ElevatedButton( style: ElevatedButton.styleFrom( minimumSize: Size(30,30) , backgroundColor: Colors.blueAccent ),
                child: Text("in"),
                onPressed: () async{
                  final x = "https://www.linkedin.com/in/muhammet-melih-tumur-6069261ba/";
                  if(await canLaunchUrlString(x)){
                    await launchUrlString(x,mode: LaunchMode.externalApplication);
                  }
                }
            ),
          ],),
        SizedBox(height: 10,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Ahmet B. Çepni ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nBackend Developer',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            RichText(textAlign: TextAlign.end,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Damla Akkaya',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nFrontend Developer',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton( style: ElevatedButton.styleFrom( minimumSize: Size(30,30) , backgroundColor: Colors.blueAccent ),
                child: Text("in"),
                onPressed: () async{
                  final x = "https://www.linkedin.com/in/muhammet-melih-tumur-6069261ba/";
                  if(await canLaunchUrlString(x)){
                    await launchUrlString(x , mode: LaunchMode.externalApplication);
                  }
                }
            ),
            ElevatedButton( style: ElevatedButton.styleFrom( minimumSize: Size(30,30) , backgroundColor: Colors.blueAccent ),
                child: Text("in"),
                onPressed: () async{
                  final x = "https://www.linkedin.com/in/muhammet-melih-tumur-6069261ba/";
                  if(await canLaunchUrlString(x)){
                    await launchUrlString(x,mode: LaunchMode.externalApplication);
                  }
                }
            ),
          ],),
        SizedBox(height: 10,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Ömer Olkay ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nBackend Developer',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
            RichText(textAlign: TextAlign.end,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'A. Zuhal Yılmaz',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nFrontend Developer',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton( style: ElevatedButton.styleFrom( minimumSize: Size(30,30) , backgroundColor: Colors.blueAccent ),
                child: Text("in"),
                onPressed: () async{
                  final x = "https://www.linkedin.com/in/muhammet-melih-tumur-6069261ba/";
                  if(await canLaunchUrlString(x)){
                    await launchUrlString(x,mode: LaunchMode.externalApplication);
                  }
                }
            ),
            ElevatedButton( style: ElevatedButton.styleFrom( minimumSize: Size(30,30) , backgroundColor: Colors.blueAccent ),
                child: Text("in"),
                onPressed: () async{
                  final x = "https://www.linkedin.com/in/muhammet-melih-tumur-6069261ba/";
                  if(await canLaunchUrlString(x)){
                    await launchUrlString(x,mode: LaunchMode.externalApplication);
                  }
                }
            ),
          ],),
        SizedBox(height: 10,),
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [

            RichText(textAlign: TextAlign.end,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Sıla B. Can ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextSpan(
                    text: '\nTasarım Yardımcısı',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),

          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton( style: ElevatedButton.styleFrom( minimumSize: Size(30,30) , backgroundColor: Colors.blueAccent ),
                child: Text("in"),
                onPressed: () async{
                  final x = "https://www.linkedin.com/in/muhammet-melih-tumur-6069261ba/";
                  if(await canLaunchUrlString(x)){
                    await launchUrlString(x,mode: LaunchMode.externalApplication);
                  }
                }
            ),

          ],),
      ],
    );
  }
}

class linkbuton extends StatefulWidget {

  final String url ;
  linkbuton(this.url);

  @override
  State<linkbuton> createState() => _linkbutonState();
}

class _linkbutonState extends State<linkbuton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (await canLaunchUrl(Uri.parse(widget.url))) {
          await launchUrl(Uri.parse(widget.url));
        } else {
          throw 'Could not launch ${widget.url}';
        }
      },
      child: Text('Linke git'),
    );
  }
}


String about = "IEEE GTÜ Mobil Uygulama ekibi olarak sizler için hazırladığımız IEEE GTÜ Mobil Uygulamasına  HOŞGELDİNİZ ! \nIEEE GTÜ Öğrenci Topluluğu olarak 14 komitemizle birlikte teknik ve sosyal konularda birçok etkinlik, teknik gezi ve eğitimlerle üyelerimizin iyi donanımı ve tecribeyi katıyoruz. Mobil uygulamamızla birlikte de artık kulübümüzün etkinliklerinden, yayınlarından ,duyurularından , okulumuzun ve kampüsümüzün önemli ihtiyaçlarından ve daha birçok şeyden anında haberdar olabileceksiniz." ;