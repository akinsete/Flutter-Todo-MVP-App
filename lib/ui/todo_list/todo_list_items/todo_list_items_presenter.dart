import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mvp_app/base/base_presenter.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list_model.dart';
import 'package:flutter_mvp_app/data/models/users/user_model.dart';
import 'package:flutter_mvp_app/ui/todo_list/todo_list_items/todo_list_items_mvp.dart';

class TodoListItemScreenPresenter extends BasePresenter<TodoListItemView> implements TodoListItemPresenter {

  TodoListItemView _todoListItemView;
  TodoListModel _todoListModel;
  UserModel _userModel;

  TodoListItemScreenPresenter(this._todoListModel,this._userModel);

  @override
  void setView(TodoListItemView view) {
    _todoListItemView = view;
  }

  /// This listens to changes on the user's todo-list-items and update list view.
  @override
  void getTodoList() {
    _todoListModel
        .getTodoList()
        .then((Stream<QuerySnapshot> snapshot){
      snapshot.listen((querySnapshot){
        List<TodoItem> list = List();
        querySnapshot.documents.forEach((document){
          var todoItem = TodoItem.map(document);
          todoItem.id = document.documentID;
          list.add(todoItem);
          _todoListItemView.updateItemList(list);
        });
      });
    });
  }

  @override
  void removeTodo(id) {
    _todoListModel.deleteTodoList(id);
  }

  @override
  void setTodoStatus(id,done) {
    _todoListModel.updateTodoStatus(id,done);
  }

  @override
  void signOut() {
    _userModel.signOutUser();
    _todoListItemView.signOutCompleted();
  }

  @override
  void removeView() {
    _todoListItemView = null;
  }




}