import 'package:firebase_auth/firebase_auth.dart';

abstract class UserModelInterface {
  /// This class contains a list of callback models that can be accessed on the UserModel

  Future<String> authenticateUser(String email, String password);
  Future<List<String>> checkIfUserEmailExist(String email);
  Future<FirebaseUser> createAccount(String email, String password);
}