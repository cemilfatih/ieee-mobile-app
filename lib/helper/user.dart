
class user{
  final String id;
  final String name;
  final String surname;
  final String mail;
  final String telNum;
  final String sClass;
  final String department;
  final String committee;
  final String password;
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
    level: json['level']
  );
/*
  String get password => _password;

  set password(String value) {
    _password = value;
  }
  String get id => _id;
  set String(int value) {
    _id = value;
  }

  String get name => _name;
  set name(String value) {
    _name = value;
  }

  String get surname => _surname;
  set surname(String value) {
    _surname = value;
  }

  String get mail => _mail;
  set mail(String value) {
    _mail = value;
  }

  String get telNum => _telNum;
  set telNum(String value) {
    _telNum = value;
  }

  String get sClass => _sClass;
  set sClass(String value) {
    _sClass = value;
  }

  String get department => _department;
  set department(String value) {
    _department = value;
  }

  String get committee => _committee;
  set committee(String value) {
    _committee = value;
  }

  String get school => _school;
  set school(String value) {
    _school = value;
  }

  int get getAuth => _getAuth;
  set getAuth(int value) {
    _getAuth = value;
  }
*/
}