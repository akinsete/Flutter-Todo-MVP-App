class TodoItem {
  String _id;
  String _title;
  bool _status;

  TodoItem(this._id,this._title,this._status);

  TodoItem.map(dynamic obj){
    this._id = obj["id"];
    this._title = obj["title"];
    this._status = obj["status"];
  }

  String get id => _id;
  String get title => _title;
  bool get status => _status;


  Map<String, dynamic> toMap() {
    var obj = new Map<String, dynamic>();
    obj["id"] = _id;
    obj["title"] = _title;
    obj["status"] = _status;
    return obj;
  }

  set title(String value) => _title = value;
  set id(String value) => _id = value;
  set status(bool value) => _status = value;
}