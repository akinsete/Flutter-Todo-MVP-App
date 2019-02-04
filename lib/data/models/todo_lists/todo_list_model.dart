import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mvp_app/data/api/todo_list_api_service.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list_model_interface.dart';

class TodoListModel extends TodoListModelInterface{

  TodoListApiService _todoListApiService;

  TodoListModel(this._todoListApiService);

  @override
  Future<TodoItem> addTodoList(TodoItem item) {
    return _todoListApiService.createTodoListItem(item);
  }

  @override
  Future<void> deleteTodoList(String id) {
    return _todoListApiService.deleteTodoListItem(id);
  }

  @override
  Future<Stream<QuerySnapshot>> getTodoList() {
    return _todoListApiService.fetchTodoList();
  }

  @override
  Future<void> updateTodoStatus(String id, bool done) {
    return _todoListApiService.updateTodoStatus(id,done);
  }

  @override
  Future<TodoItem> updateTodo(TodoItem item) {
    return _todoListApiService.updateTodoListItem(item);
  }

}