import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class hakkinda extends StatefulWidget {
  const hakkinda({super.key});

  @override
  State<hakkinda> createState() => _hakkindaState();
}

class _hakkindaState extends State<hakkinda> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child : Image.asset("lib/assets/images/about2.png")
          ),
          Text("Mobil Uygulama Ekibimiz : "),
          SizedBox(height: 10,),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Melih Tumur ',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                TextSpan(
                  text: '- Ekip lideri',
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Ahmet Yiğit ',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Backend Developer',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Selen Erdoğan',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' Frontend Developer',
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
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Cemil F. Yol',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' Backend Developer',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Yusuf E. Nalbant ',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Frontend Developer',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ],
          ),SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Ahmet B. Çepni ',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Backend Developer',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Damla Akkaya',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' Frontend Developer',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ],
          ),SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Ömer Olkay ',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Backend Developer',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'A. Zuhal Yılmaz',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    TextSpan(
                      text: ' Frontend Developer',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ],
          ),SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [

              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Sıla B. Can ',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Tasarım Yardımcısı',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
           
            ],
          )
        ],
      ),
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
