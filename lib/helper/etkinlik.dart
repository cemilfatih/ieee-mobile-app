
import 'package:cloud_firestore/cloud_firestore.dart';

class etkinlik{

  final String ad;
  final String id;
  final String not;
  final String komite;
  final Timestamp date;
  final List<dynamic> katilimcilar;


  etkinlik({
    this.id="id",
    required this.ad,
    required this.not,
    required this.date,
    required this.komite,
    required this.katilimcilar,
  });

//  User(this._id,this._name, this._surname, this._mail, this._telNum, this._sClass,
  //    this._department, this._committee, this._school, this._password);

  Map<String, dynamic> toJson() => {
    'id':id,
    'ad':ad,
    'not':not,
    'date':date,
    'komite':komite,
    'katilimcilar':katilimcilar,

  };

  static etkinlik fromJson(Map<String, dynamic> json) => etkinlik(
    id: json['id'],
    ad: json['ad'],
    not: json['not'],
    date: json['date'],
    komite: json['komite'],
    katilimcilar: json['katilimcilar'],
  );

}