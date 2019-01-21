class User {
  String _userId;
  String _name;
  String _email;

  User.map(dynamic obj) {
    this._userId = obj["userId"];
    this._name = obj["name"];
    this._email = obj["email"];
  }

  String get name => _name;
  String get userId => _userId;
  String get email => _email;

  Map<String, dynamic> toMap() {
    var obj = new Map<String, dynamic>();
    obj["userId"] = _userId;
    obj["name"] = _name;
    obj["email"] = _email;
    return obj;
  }
}