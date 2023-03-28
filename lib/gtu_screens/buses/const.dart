import 'package:flutter/material.dart';


List<String> busNums = [
  '430',
  '440',
  'G1',
  '490',
  '490E',
  '530',
  '552',
  '558',
  '559',
  '560',
  '700'
];

List<String> busLinks = [
  'https://www.kocaeli.bel.tr/tr/main/hatlar/430/fatih-tren-ist-adem-yavuz-bey-gebze-guzeller--otobus-sefer-saatleri-ve-duraklari',
  'https://www.kocaeli.bel.tr/tr/main/hatlar/440/yavuz-selim-gebze-farabi-dh-gebze-teknik-otobus-sefer-saatleri-ve-duraklari',
  'https://www.kocaeli.bel.tr/tr/main/hatlar/G1/fatih-tren-ist-cayirova-yenikent-gebze-otobus-sefer-saatleri-ve-duraklari',
  'https://www.kocaeli.bel.tr/tr/main/hatlar/490/muallimkoy-gebze-otogar-yeni-mahalle-gebze-te-otobus-sefer-saatleri-ve-duraklari',
  'https://www.kocaeli.bel.tr/tr/main/hatlar/490E/muallimkoy-kyk-yurdu-gebze-teknik-universites-otobus-sefer-saatleri-ve-duraklari',
  'https://www.kocaeli.bel.tr/tr/main/hatlar/530/darica-marmaray-istasyon-izmit-umuttepe-otobus-sefer-saatleri-ve-duraklari',
  'https://www.kocaeli.bel.tr/tr/main/hatlar/552/gtu-emek-bosna-cad-adliye-gebze-fatih-dh-otobus-sefer-saatleri-ve-duraklari',
  'https://www.kocaeli.bel.tr/tr/main/hatlar/558/gtu-cicekciler-cagdaskent-mpasa-cami-fatih-de-otobus-sefer-saatleri-ve-duraklari',
  'https://www.kocaeli.bel.tr/tr/main/hatlar/559/fatih-tren-istasyonu-gtu-belediye-spinar-kaym-otobus-sefer-saatleri-ve-duraklari',
  'https://www.kocaeli.bel.tr/tr/main/hatlar/560/fatih-tren-istasyonu-gebze-otogar-otobus-sefer-saatleri-ve-duraklari',
  'https://www.kocaeli.bel.tr/tr/main/hatlar/700/golcuk-kmursel-altinova-gebze-gtu-marmaray-fa-otobus-sefer-saatleri-ve-duraklari'
];

List<String> busNames = [
  'Fatih Tren İstasyonu- Güzeller OSB',
  'Gebze Teknik Üni-Yavuz Selim',
  'Fatih Tren İst-Çayırova-Yenikent-Mustafapaşa-Köşklüçeşme-Beylikbağı',
  'Gebze Teknik Üni.-Yeni Mahalle-Gebze Otogar-Muallimköy',
  'Gebze Teknik Üni.-Muallimköy KYK Yurdu',
  'Darıca-Gebze-İzmit-Umuttepe',
  'Fatih Tren İst. Emek-Bosna Cad-Adliye-gebze-Fatih D.H.',
  'Gtü-Çiçekciler-Çağdaşeknt-Gebze',
  'Fatih Tren İst.-Kaymakamlık',
  'Fatih İst.-Gebze Otogar',
  'Marmaray Fatih İst-Gebze Teknik Üni.-Kentönü',
];

//provider busIndex diye
//default değeri 0 yap
//aşağıdaki listenin ilk değerini 0 yap
//diğer sayfada butona basınca hem sayfa indexi değişsin hem

//

Color yellow1 = Color(0xfff12711);
Color yellow2 = Color(0xfff5af19);

Color red1 = Color(0xffF00000);
Color red2 = Color(0xffbe1238);


var colours = [
  yellow1,
  red1,
  red1,
  yellow1,
  yellow1,
  red1,
  red1,
  yellow1,
  yellow1,
  red1,
  red1,
  yellow1,
  yellow1,
  red1,
  red1,
  yellow1,
  yellow1,
  red1,
  red1,
  yellow1,
  yellow1,
  red1,
  red1,
  yellow1,
  yellow1,
  red1,
  red1,
  yellow1,
  yellow1,
  red1,
  red1,
  yellow1
];
var colours2 = [
  yellow2,
  red2,
  red2,
  yellow2,
  yellow2,
  red2,
  red2,
  yellow2,
  yellow2,
  red2,
  red2,
  yellow2,
  yellow2,
  red2,
  red2,
  yellow2,
  yellow2,
  red2,
  red2,
  yellow2,
  yellow2,
  red2,
  red2,
  yellow2,
  yellow2,
  red2,
  red2,
  yellow2,
  yellow2,
  red2,
  red2,
  yellow2
];

var text_colours = [
  Colors.black,
  Colors.white,
  Colors.white,
  Colors.black,
  Colors.black,
  Colors.white,
  Colors.white,
  Colors.black,
  Colors.black,
  Colors.white,
  Colors.white,
  Colors.black,
  Colors.black,
  Colors.white,
  Colors.white,
  Colors.black
];

var busIcons = [
  "lib/assets/images/bus2.png",
  "lib/assets/images/bus2b.png",
  "lib/assets/images/bus2b.png",
  "lib/assets/images/bus2.png",
  "lib/assets/images/bus2.png",
  "lib/assets/images/bus2b.png",
  "lib/assets/images/bus2b.png",
  "lib/assets/images/bus2.png",
  "lib/assets/images/bus2.png",
  "lib/assets/images/bus2b.png",
  "lib/assets/images/bus2b.png",
  "lib/assets/images/bus2.png",
  "lib/assets/images/bus2.png",
  "lib/assets/images/bus2b.png",
  "lib/assets/images/bus2b.png",
  "lib/assets/images/bus2.png",
];
