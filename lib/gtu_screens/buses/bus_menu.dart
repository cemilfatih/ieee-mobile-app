import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'const.dart';
import 'tablepage.dart';
import '../../constants/menu_button.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:ieee_mobile_app/constants/stateData.dart';



class bus_menu extends StatefulWidget {
  @override
  State<bus_menu> createState() => _bus_menuState();
}

class _bus_menuState extends State<bus_menu> {


  @override
  Widget build(BuildContext context) {

    var defaultIndex = 0;
    // var busIndex = Provider.of<StateData>(context).busesIndex;
    var pages = [null , TablePage(busIndex: Provider.of<StateData>(context).busesIndex)] ;



    // for (int i = 0; i < busNums.length; i++) {
    //   _fetchHTMLContent(i);
    // }

    if (defaultIndex == 0) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5 / 1,
        ),
        itemCount: busNames.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
            child: InkWell(
                onTap: () {
                  setState(() {
                    //
                    // Provider.of<StateData>(context, listen: false).newIndexBuses(index);
                    // print(Provider.of<StateData>(context , listen : false).busesIndex);
                    // defaultIndex = 1;
                    Navigator.push(context , MaterialPageRoute(builder: (context) => TablePage(busIndex: index) )
                    );
                  });
                },
                child: menu_button(
                    colours[index],
                    colours2[index],
                    text_colours[index],
                    busIcons[index],
                    busNums[index],
                    2)),
          );
        },
      );
    }
    else{ return WillPopScope(
      onWillPop: () async {
        setState(() {
          defaultIndex = 0;
        });
        return false;
      },
      child: Scaffold(
        body: pages[defaultIndex],
      ),);}
  }
}
//
// Future<void> _fetchHTMLContent(int busIndex) async {
//   /// bu fonksiyon günde bi kere yapılması gereken fonksiyon ben şuanlık hangi otobüsün sayfasına tıkladıysam onun saatlerini çekiyor
//   ///   ama bunu her otobüs için günde 1 kere yapıp depolamalıyız
//   dynamic tableSize;
//   dynamic stringElement;
//
//   final response = await http.get(Uri.parse(busLinks[busIndex]));
//   final document = parser.parse(response.body);
//   tableSize = document
//       .getElementsByClassName("tab-pane fade in active")[0]
//       .children[0]
//       .children[1]
//       .children[1]
//       .children[1]
//       .querySelector("tr:last-child")
//       ?.children[0]
//       .children[0]
//       .firstChild
//       .toString();
//   for (int i = 0; (i + 1).toString() != tableSize.replaceAll("\"", ""); i++) {
//     stringElement = document
//         .getElementsByClassName("tab-pane fade in active")[0]
//         .children[0]
//         .children[1]
//         .children[1]
//         .children[1]
//         .children[i] // 0, 1, 2, to get to the next
//         .children[1]
//         .children[0]
//         .firstChild
//         .toString();
//     if (stringElement == null) break;
//     busTables[busIndex][0].add(stringElement);
//   }
//   tableSize = document
//       .getElementsByClassName("tab-pane fade in active")[0]
//       .children[0]
//       .children[2]
//       .children[1]
//       .children[1]
//       .querySelector("tr:last-child")
//       ?.children[0]
//       .children[0]
//       .firstChild
//       .toString();
//   for (int i = 0; (i + 1).toString() != tableSize.replaceAll("\"", ""); i++) {
//     stringElement = document
//         .getElementsByClassName("tab-pane fade in active")[0]
//         .children[0]
//         .children[2]
//         .children[1]
//         .children[1]
//         .children[i] // 0, 1, 2, to get to the next
//         .children[1]
//         .children[0]
//         .firstChild
//         .toString();
//
//     busTables[busIndex][1].add(stringElement);
//   }
// }