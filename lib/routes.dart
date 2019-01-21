import 'package:flutter/material.dart';
import 'package:flutter_mvp_app/ui/todo_list/todo_list_items/todo_list_items_screen.dart';
import 'package:flutter_mvp_app/ui/user/authentication/authentication_screen.dart';

final routes = {
  '/autehntication': (BuildContext context) => new AuthenticationScreen(),
  '/dashboard': (BuildContext context) => new TodoListItemScreen()
};