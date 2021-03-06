import 'package:flutter/material.dart';
import 'package:flutter_mvp_app/base/base_state.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list.dart';
import 'package:flutter_mvp_app/di/injection.dart';
import 'package:flutter_mvp_app/ui/todo_list/create_todo/create_todo_screen.dart';
import 'package:flutter_mvp_app/ui/todo_list/todo_list_items/todo_list_items_mvp.dart';
import 'package:flutter_mvp_app/ui/todo_list/todo_list_items/todo_list_items_presenter.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:share/share.dart';

class TodoListItemScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TodoListItemScreenState();
  }

}

class TodoListItemScreenState extends BaseState<TodoListItemView> implements TodoListItemView{

  TodoListItemScreenPresenter _todoListItemScreenPresenter = Injector().todoListItemScreenPresenter;
  List<TodoItem> _todoItems = List();

  @override
  void initState() {
    super.initState();
    _todoListItemScreenPresenter.setView(this);
    _todoListItemScreenPresenter.getTodoList();
  }


  @override
  Widget build(BuildContext context) {


    return Material(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: Text("FlutterMVP Todo", style: TextStyle(color: Colors.black)),
          iconTheme: IconThemeData(
            color: Colors.blueAccent, //change your color here
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: ActionChip(
                  backgroundColor: Colors.blueAccent,
                  label: Text("Logout", style: TextStyle(color: Colors.white)),
                  onPressed: (){
                    _todoListItemScreenPresenter.signOut();
                  }
              )
            ),
          ],
        ),
        floatingActionButton: SpeedDial (
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          visible: true,
          curve: Curves.fastOutSlowIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
              child: Icon(Icons.share),
              backgroundColor: Colors.orange,
              label: 'Share',
              onTap: () => _shareTodoList(),
            ),
            SpeedDialChild(
              child: Icon(Icons.create),
              backgroundColor: Colors.green,
              label: 'Create Todo',
              onTap: () => Navigator.of(context).pushNamed("/create_todo"),
            ),
          ],
        ),
        body:  Container(
          padding: EdgeInsets.only(top: 15,left: 5, right: 5),
          color: Colors.white,
          child: createTodoList(_todoItems),
        ),
      ),
    );
  }


  Widget createTodoList(List<TodoItem> todoItems) {
    List<Widget> tiles = new List();
    todoItems.forEach((TodoItem todoItem){
      tiles.add(
        Container(
          margin: EdgeInsets.only(bottom: 15),
          child: ListTile(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateTodoListScreen(todoItem: todoItem)),
              );
//              Navigator.of(context).pushNamed("/create_todo");
            },
            onLongPress: (){
              confirmTodoDelete(todoItem);
            },
            contentPadding: EdgeInsets.only(left: 25,right: 18,top: 5,bottom: 5),
            dense: true,
            trailing: GestureDetector(
              onTap: (){
                _todoListItemScreenPresenter.setTodoStatus(todoItem.id, !todoItem.status);
              },
              child: todoItem.status ? Icon(Icons.check_circle,color: Colors.blueAccent) : Icon(Icons.radio_button_unchecked,color: Colors.grey),
            ),
            title: Text(
                todoItem.title,
                style: TextStyle(
                    decoration: todoItem.status ? TextDecoration.lineThrough : TextDecoration.none,
                    fontSize: 19,
                    color: todoItem.status ? Colors.grey : Colors.black),
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow:[
                BoxShadow(
                  offset: Offset(2, 2),
                    color: Colors.grey,
                    blurRadius: 6.0,
                    spreadRadius: 1.0
                )
              ]
          ),
        )
      );
    });
    return ListView(
      padding: EdgeInsets.all(10), children: tiles);
  }

  void _shareTodoList() {
    int i = 1;
    var sb = new StringBuffer();
    _todoItems.forEach((item){
      sb.write(i.toString() + ". " + item.title);
      sb.write("\n");
      sb.write("\n");
      i++;
    });
    Share.share(sb.toString());
  }


  @override
  void updateItemList(List<TodoItem> todoLists) {
    setState(() {
      _todoItems = todoLists;
    });
  }

  Future<void> confirmTodoDelete(TodoItem todoItem) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Remove ["+ todoItem.title+"]"),
          content: Text("Are you sure?"),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes', style: TextStyle(color: Colors.red)),
              onPressed: () {
                setState(() {
                  _todoItems.remove(todoItem);
                });
                _todoListItemScreenPresenter.removeTodo(todoItem.id);
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void signOutCompleted() {
    Navigator.of(context).pushReplacementNamed("/authentication");
  }




}

