import 'package:flutter_mvp_app/data/models/todo_lists/todo_list.dart';

abstract class TodoListModelInterface {
  /// This class contains a list of callback models that can be accessed on the TodoListModel

  Future<List<TodoItem>> getTodoList();
  Future<TodoItem> addTodoList(String title);
  Future<bool> deleteTodoList(String id);
  Future<bool> markAsDone(String id);
}