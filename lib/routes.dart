import 'package:flutter/material.dart';
import 'package:flutter_mvp_app/ui/todo_list/create_todo/create_todo_screen.dart';
import 'package:flutter_mvp_app/ui/todo_list/todo_list_items/todo_list_items_screen.dart';
import 'package:flutter_mvp_app/ui/user/authentication/authentication_screen.dart';
import 'package:flutter_mvp_app/ui/user/create_account/create_account_screen.dart';

final routes = {
  '/authentication': (BuildContext context) => new AuthenticationScreen(),
  '/create_account': (BuildContext context) => new CreateAccountScreen(),
  '/dashboard': (BuildContext context) => new TodoListItemScreen(),
  '/create_todo': (BuildContext context) => new CreateTodoListScreen()
};