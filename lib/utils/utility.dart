bool isValidPassword(String password){
  return password != null && password.length > 0;
}

bool isEmail(email) {
  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(email);
}

bool isValidName(name){
  return name != null && name.length > 2;
}

bool isTodoValid(todo){
  return todo != null && todo.length > 4;
}