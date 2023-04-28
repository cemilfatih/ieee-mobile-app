import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ieee_mobile_app/extensions/isValid.dart';
import 'package:ieee_mobile_app/logic/mail_verify.dart';
import '../helper/helper.dart';
import 'loginPage.dart';

const List<String> komiteList = <String>['comsoc', 'cs', 'eac','embs','externalrelations','girisimcilik','ik','kariyer','malzeme','mat','medya','pes','ras','wie'];

const List<String> komiteList2 = <String>['ComSoc ', 'Computer Society', 'EAC','EMBS','External Relations','Girişmcilik','İnsan Kaynakları','Kişisel G. ve Kariyer','Malzeme','Matematik','Medya ve Tasarım','PES','RAS','WİE'];



// DATABASEYE GÖRE DÜZENLE
String secilenKomite = "";

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {


  final _signupFormKey = GlobalKey<FormState>();
  String? name;
  String? lName;
  String? mail;
  String? telNo;
  String? department;
  String? committee;
  String? psw;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: FloatingActionButton( backgroundColor: Colors.black,mini: true,onPressed:() {
          Navigator.pop(context);

        },
          child : Icon(Icons.arrow_back),
        ),
        backgroundColor: Color(0xff00609c),
        body: SingleChildScrollView(
          child: Form(
            key: _signupFormKey,
            child: Column(
              children: [
                const PageHeader(),
                Container(
                  decoration: const BoxDecoration(
                    color:  Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
                  ),
                  child: Column(
                    children: [
                      const PageHeading(title: 'Kayıt Ol',),
                      // FOTOĞRAF SEÇME YERİ
                      // SizedBox(
                      //   width: 130,
                      //   height: 130,
                      //   child: CircleAvatar(
                      //     backgroundColor: Colors.grey.shade200,
                      //
                      //     child: Stack(
                      //       children: [
                      //         Positioned(
                      //           bottom: 5,
                      //           right: 5,
                      //           child: GestureDetector(
                      //             onTap:(){},
                      //             child: Container(
                      //               height: 50,
                      //               width: 50,
                      //               decoration: BoxDecoration(
                      //                 color: Colors.blue.shade400,
                      //                 border: Border.all(color: Colors.white, width: 3),
                      //                 borderRadius: BorderRadius.circular(25),
                      //               ),
                      //               child: const Icon(
                      //                 Icons.camera_alt_sharp,
                      //                 color: Colors.white,
                      //                 size: 25,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 16,),
                      CustomInputField(
                          labelText: 'İsim ve Soyisim',
                          hintText: 'İsmi & Soyisim Giriniz',
                          isDense: true,
                          onSaved: (textValue){
                            name = textValue!;
                          },
                          validator: (textValue) {

                            if(textValue!.isNull){
                              return 'This part can not be null';
                            }
                            else if(!textValue.isValidName){
                              return 'Invalid Format';

                            }

                            return null;
                          }
                      ),
                      const SizedBox(height: 16,),
                      CustomInputField(
                          labelText: 'Email',
                          hintText: 'Email Giriniz',
                          isDense: true,
                          onSaved: (textValue){
                            mail = textValue!;
                          },
                          validator: (textValue) {

                            if(textValue!.isNull){
                              return 'This part can not be null';
                            }

                            // şu an için gtu uzantılı mailleri invalid olarak ayarladım.
                            //domain sorunu çzöülüp gtu mailleri test edebilir hale geldiğimizde değişecek

                            else if(textValue.isValidMail){
                              return 'Invalid Format';

                            }

                            return null;
                          }
                      ),
                      const SizedBox(height: 16,),
                      CustomInputField(
                          labelText: 'Telefon Numarası',
                          hintText: 'Telefon Numaranızı Giriniz',
                          isDense: true,
                          onSaved: (textValue){
                            telNo = textValue!;
                          },
                          validator: (textValue) {

                            if(textValue!.isNull){
                              return 'This part can not be null';
                            }
                            else if(!textValue.isValidPhone){
                              return 'Invalid Format';

                            }

                            return null;
                          }
                      ),
                      const SizedBox(height: 16,),
                      CustomInputField(
                        labelText: 'Şifre',
                        hintText: 'Belirlediğiniz Şifreyi Giriniz',
                        isDense: true,
                        obscureText: true,
                        onSaved: (textValue){
                          psw = textValue!;
                        },
                        validator: (textValue) {

                          if(textValue!.isNull){
                            return 'This part can not be null';
                          }
                          else if(!textValue.isValidPassword){
                            return 'Invalid Format';

                          }

                          return null;
                        },
                        suffixIcon: true,
                      ),
                      const SizedBox(height: 16,),
                      CustomInputField(
                          labelText: 'Bölüm',
                          hintText: 'Bölümünüzü Giriniz',
                          isDense: true,
                          onSaved: (textValue){
                            department = textValue!;
                          },
                          validator: (textValue) {

                            if(textValue!.isNull){
                              return 'This part can not be null';
                            }

                            return null;
                          }
                      ),
                      const SizedBox(height: 16,),
                      Container(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Komite Seç  " , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 17),),
                            komiteSec(),
                          ],
                        ),
                      ),

                      const SizedBox(height: 22,),
                      CustomFormButton(innerText: 'Kayıt Ol', onPressed: _handleSignupUser,),
                      const SizedBox(height: 18,),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Zaten Hesabınız Var Mı? ', style: TextStyle(fontSize: 13, color: Color(0xff939393), fontWeight: FontWeight.bold),),
                            GestureDetector(
                              onTap: () => {

                              },
                              child: const Text('Giriş Yapın', style: TextStyle(fontSize: 15, color: Color(0xff748288), fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleSignupUser() async {

    try {
      // signup user
      if (_signupFormKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Veri Gönderiliyor..')),
        );

        _signupFormKey.currentState!.save();

        // !!!!soy ad ve sınıf eklenmeli
        bool isRegistered = await Helper.register( name, " ", mail, telNo, "2", department, secilenKomite, psw);

        if (isRegistered){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  mailVerifyService()),
          );
        }
      }

    }catch(error){
      print(error.toString());
    }

  }
}


class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [

        SizedBox(
          width: double.infinity,
          height: size.height * 0.1,
          child: Image.asset('lib/assets/images/ieee_white.png'),
        ),
        SizedBox(
          width: double.infinity,
          height: size.height * 0.3,
          child: Image.asset('lib/assets/images/cocuklar.png'),
        ),
      ],
    );
  }
}

class CustomFormButton extends StatelessWidget {
  final String innerText;
  final void Function()? onPressed;
  const CustomFormButton({Key? key, required this.innerText, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.yellow[700],
        borderRadius: BorderRadius.circular(26),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(innerText, style: const TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.normal),),
      ),
    );
  }
}

class PageHeading extends StatelessWidget {
  final String title;
  const PageHeading({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 25),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,

        ),
      ),
    );
  }
}

class CustomInputField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final String? Function(String?) validator;
  final String? Function(String?) onSaved;
  final bool suffixIcon;
  final bool? isDense;
  final bool obscureText;

  const CustomInputField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.validator,
    required this.onSaved,
    this.suffixIcon = false,
    this.isDense,
    this.obscureText = false
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  //
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.labelText, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ),
          TextFormField(
            autocorrect: false,
            obscureText: (widget.obscureText && _obscureText),
            decoration: InputDecoration(
              isDense: (widget.isDense != null) ? widget.isDense : false,
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.remove_red_eye : Icons.visibility_off_outlined,
                  color: Colors.black54,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ): null,
              suffixIconConstraints: (widget.isDense != null) ? const BoxConstraints(
                  maxHeight: 33
              ): null,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: widget.validator,
            onSaved: widget.onSaved,
          ),
        ],
      ),
    );
  }
}

class komiteSec extends StatefulWidget {
  const komiteSec({super.key});

  @override
  State<komiteSec> createState() => _komiteSecState();
}

class _komiteSecState extends State<komiteSec> {

  String dropdownValue = komiteList.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          secilenKomite = dropdownValue.toLowerCase();
        });
      },
      items: komiteList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

