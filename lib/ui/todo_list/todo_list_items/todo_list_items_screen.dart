import 'package:flutter/material.dart';
import 'package:flutter_mvp_app/base/base_state.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list.dart';
import 'package:flutter_mvp_app/ui/todo_list/todo_list_items/todo_list_items_mvp.dart';

class TodoListItemScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TodoListItemScreenState();
  }

}

class TodoListItemScreenState extends BaseState<TodoListItemView> implements TodoListItemView{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.amber,
    );
  }

  @override
  void updateItemList(List<TodoItem> todoLists) {
    // TODO: implement updateItemList
  }
}