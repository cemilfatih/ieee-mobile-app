class etkinlik{

  final String ad;
  final String id;
  final String not;
  final String komite;
  final String tarih;
  final List<String> katilimcilar;


  etkinlik({
    this.id="id",
    required this.ad,
    required this.not,
    required this.tarih,
    required this.komite,
    required this.katilimcilar,
  });

//  User(this._id,this._name, this._surname, this._mail, this._telNum, this._sClass,
//    this._department, this._committee, this._school, this._password);

  Map<String, dynamic> toJson() => {
    'id':id,
    'ad':ad,
    'not':not,
    'tarih':tarih,
    'komite':komite,
    'katilimcilar':katilimcilar,
    'katilanlar':[],

  };

  static etkinlik fromJson(Map<String, dynamic> json) => etkinlik(
    id: json['id'],
    ad: json['ad'],
    not: json['not'],
    tarih: json['tarih'],
    komite: json['komite'],
    katilimcilar: json['katilimcilar'],
  );

}