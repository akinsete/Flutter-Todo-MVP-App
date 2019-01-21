import 'package:flutter_mvp_app/data/api/todo_list_api_service.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list_model_interface.dart';

class TodoListModel extends TodoListModelInterface{

  TodoListApiService _todoListApiService;

  TodoListModel(this._todoListApiService);

  @override
  Future<TodoItem> addTodoList(String title) {
    // TODO: implement addTodoList
    return null;
  }

  @override
  Future<bool> deleteTodoList(String id) {
    // TODO: implement deleteTodoList
    return null;
  }

  @override
  Future<bool> markAsDone(String id) {
    // TODO: implement markAsDone
    return null;
  }

  @override
  Future<List<TodoItem>> getTodoList() {
    // TODO: implement getTodoList
    return null;
  }

}