
class user{
  static user currentUser = user(id: "-1",
      name: "name",
      surname: "surname",
      mail: "mail",
      telNum: "telNum",
      sClass: "sClass",
      department: "department",
      committee: "committee",
      password: "password",
      level: 1,
      katEtkinlikler: <String>[]);

  final String id;
  final String name;
  final String surname;
  final String mail;
  final String telNum;
  final String sClass;
  final String department;
  final String committee;
  final String password;
  final List<dynamic> katEtkinlikler;
  final int level;


  late int _getAuth;

  user({
    this.id='',
    required this.name,
    required this.surname,
    required this.mail,
    required this.telNum,
    required this.sClass,
    required this.department,
    required this.committee,
    required this.password,
    required this.level,
    required this.katEtkinlikler,
});

//  User(this._id,this._name, this._surname, this._mail, this._telNum, this._sClass,
  //    this._department, this._committee, this._school, this._password);

  Map<String, dynamic> toJson() => {
    'id':id,
    'name':name,
    'surname':surname,
    'password':password,
    'mail':mail,
    'telephone':telNum,
    'sClass':sClass,
    'department':department,
    'committee':committee,
    'level':level,
    'katEtkinlikler': {},
  };

  static user fromJson(Map<String, dynamic> json) => user(
    id: json['id'],
    name: json['name'],
    surname: json['surname'],
    mail: json['mail'],
    telNum: json['telephone'],
    sClass: json['sClass'],
    department: json['department'],
    committee: json['committee'],
    password: json['password'],
    level: json['level'],
      katEtkinlikler: json['katEtkinlikler'],
  );

}