import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list.dart';

abstract class TodoListModelInterface {
  /// This class contains a list of callback models that can be accessed on the TodoListModel

  Future<Stream<QuerySnapshot>> getTodoList();
  Future<TodoItem> addTodoList(TodoItem item);
  Future<void> deleteTodoList(String id);
  Future<void> updateTodoStatus(String id, bool done);
}