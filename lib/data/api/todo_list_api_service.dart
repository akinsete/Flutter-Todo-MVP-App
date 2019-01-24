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

  Future<FirebaseUser> createUserAccount(String name, String email,String password) async{
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)
        .then((FirebaseUser user){
        _saveUserInfo(name,email,user.uid);
    });
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  void _saveUserInfo(String name, String email, String uid){
    _fireStore.collection('users').document(uid).setData({
      'name': name,
      'uid': uid,
      'email': email
    });
  }

  Future<Stream<QuerySnapshot>> fetchTodoList() async {
    FirebaseUser firebaseUser = await _firebaseAuth.currentUser();
    String uid = firebaseUser.uid;
    return _fireStore.collection("users").document(uid).collection("todo").snapshots();
  }

  Future<TodoItem> createTodoListItem(TodoItem item) async {
    FirebaseUser firebaseUser = await _firebaseAuth.currentUser();
    String uid = firebaseUser.uid;
    _fireStore.collection("users").document(uid)
          .collection("todo")
          .add(item.toMap());
    return item;
  }

  Future<void> deleteTodoListItem(String id) async {
    FirebaseUser firebaseUser = await _firebaseAuth.currentUser();
    String uid = firebaseUser.uid;
    _fireStore.collection("users").document(uid).collection("todo").document(id).delete();
  }


  Future<void> updateTodoStatus(String id,bool done) async {
    FirebaseUser firebaseUser = await _firebaseAuth.currentUser();
    String uid = firebaseUser.uid;
    _fireStore.collection("users").document(uid).collection("todo").document(id).updateData({'status':done});
  }



}