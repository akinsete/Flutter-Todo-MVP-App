import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list.dart';

class TodoListApiService {

  /// ApiService class contains your API implementation. In this case we are using firebase
  /// as source of our backend data. You can use whatever backend you choose.
  /// This basically exposes your API callback to different models
  /// Also take note, method names are explicitly descriptive. This is not a must but it only makes the code base easy to understand)

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _fireStore = Firestore.instance;


  Future<String> authenticateUser(String email, String password) async {
    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return user.uid;
  }

  Future<FirebaseUser> createUserAccount(String email,String password) async{
    return await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<List<String>> checkIfUserEmailExist(String email){
    return _firebaseAuth.fetchProvidersForEmail(email: email);
  }

  Future<void> fetchUserInfo(String userId) async {
    return _fireStore.collection("users")
        .document(userId)
        .snapshots().listen((response){

    });
  }

  Future<List<TodoItem>> fetchTodoList() async {
    List<TodoItem> items = List();
    TodoItem _item =  TodoItem();
    items.add(_item);

    return items;
  }

  Future<TodoItem> createTodoListItem(String title) async {
    TodoItem _item =  TodoItem();

    return _item;
  }

  Future<bool> deleteTodoListItem(String id) async {
      return false;
  }


  Future<bool> markItemAsDone(String id) async {
    return false;
  }



}