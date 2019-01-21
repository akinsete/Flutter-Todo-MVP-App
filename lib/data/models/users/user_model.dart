import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mvp_app/data/api/todo_list_api_service.dart';
import 'package:flutter_mvp_app/data/models/users/user_model_interface.dart';

class UserModel extends UserModelInterface {

  TodoListApiService _todoListApiService;

  UserModel(this._todoListApiService);

  @override
  Future<List<String>> checkIfUserEmailExist(String email) {
    // TODO: implement checkIfUserEmailExist
    return _todoListApiService.checkIfUserEmailExist(email);
  }

  @override
  Future<FirebaseUser> createAccount(String email, String password) {
    // TODO: implement createAccount
    return _todoListApiService.createUserAccount(email, password);
  }

  @override
  Future<String> authenticateUser(String email, String password) {
    // TODO: implement loginUser
    return _todoListApiService.authenticateUser(email, password);
  }

}