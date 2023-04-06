import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ieee_mobile_app/helper/helper.dart';
import 'package:ieee_mobile_app/constants/uye_onay_button.dart';
import 'package:ieee_mobile_app/helper/user.dart';

class uye_al extends StatefulWidget {
  uye_al({Key? key}) : super(key: key);


  @override
  _uye_alState createState() => _uye_alState();
}

class _uye_alState extends State<uye_al> {
  List<String> idListesi = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    Helper.onaylanacakUyeler = [];
    Helper.onaylanacakUyeSayisi = 0;
    bool _isLoading2 = true;

    await FirebaseFirestore.instance
        .collection('komiteler')
        .doc(user.currentUser.committee)
        .get()
        .then((value) {
        List<String> pointlist = List.from(value['onaylanacakUyeler']);

        if(!pointlist.isEmpty) {
          pointlist.forEach((element) {
            idListesi.add(element);
            Helper.onaylanacakUyeSayisi++;
          });
        }

        setState(() {
          _isLoading2 = false;
        });

    });

    while(_isLoading2);

    if(idListesi.isEmpty) _isLoading = false;
      else {


      idListesi.forEach((element) async {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(element)
            .get()
            .then((value) {
          List<String> temp = [element];
          temp.add(value['name']);
          temp.add(value['mail']);

          setState(() {
            Helper.onaylanacakUyeler.add(temp);
            _isLoading = false;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SafeArea(
        child: Scaffold(

            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                children: [

                  for (int x = 0; x < Helper.onaylanacakUyeSayisi; x++) ...[
                    Container(width: double.infinity,
                      child: uye_onay_button(
                            Helper.onaylanacakUyeler[x][0],
                            Helper.onaylanacakUyeler[x][1],
                            Helper.onaylanacakUyeler[x][2],
                          ),
                    ),
                  ],
                ],
              ),
            )),
      ),
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:ieee_mobile_app/helper/helper.dart';
import "uye_al_panel.dart";
import 'package:ieee_mobile_app/constants/kayit_button.dart';
import 'package:ieee_mobile_app/helper/user.dart';

void main() {
  user.currentUser.level;
  runApp(const uye_al());
}

class uye_al extends StatefulWidget {
  const uye_al({super.key});

  @override
  State<uye_al> createState() => _uye_alState();
}

class _uye_alState extends State<uye_al> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: Visibility(
              visible: user.currentUser.level > 1,
              child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => uye_al_panel()),
                    );
                  },
                  child: Icon(Icons.add_circle_outline_rounded),
                  backgroundColor: Colors.indigo)),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,mainAxisSize: MainAxisSize.max,
              children: [
                for (int x = 0; x < Helper.etkinlikSayisi; x++) ...[
                  Container(width: double.infinity,
                    child: kayit_button(
                        Helper.etkinlikler[x][2],
                        Helper.etkinlikler[x][0],
                        Helper.etkinlikler[x][1],
                        Helper.etkinlikler[x][3]),
                  ),
                ],
              ],
            ),
          )),
    );
  }
}
*/