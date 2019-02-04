import 'package:flutter/material.dart';
import 'package:flutter_mvp_app/base/base_state.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list.dart';
import 'package:flutter_mvp_app/di/injection.dart';
import 'package:flutter_mvp_app/ui/todo_list/create_todo/create_todo_mvp.dart';
import 'package:flutter_mvp_app/ui/todo_list/create_todo/create_todo_presenter.dart';
import 'package:flutter_mvp_app/utils/utility.dart';

class CreateTodoListScreen extends StatefulWidget {

  CreateTodoListScreen({Key key, this.todoItem}) : super(key: key);
  final TodoItem todoItem;

  @override
  State<StatefulWidget> createState() {
    return CreateTodoListScreenState(todoItem);
  }

}

class CreateTodoListScreenState extends BaseState<CreateTodoListScreen> implements CreateTodoView {

  CreateTodoListScreenPresenter _createTodoListScreenPresenter = Injector().createTodoListScreenPresenter;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _title;
  bool _autoValidate = false;
  final TodoItem _todoItem;

  CreateTodoListScreenState(this._todoItem);


  @override
  void initState() {
    super.initState();

    _createTodoListScreenPresenter.setView(this);
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          automaticallyImplyLeading: true,
          title: Text(_todoItem != null ? "Edit Todo" : "Add Todo", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Form(
                key: _formKey,
                autovalidate: _autoValidate,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _todoItem != null ?_todoItem.title : "",
                      maxLines: 4,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black
                      ),
                      decoration: new InputDecoration(
                          enabledBorder: const UnderlineInputBorder(borderSide: const BorderSide(color: Colors.grey, width: 0.0)),
                          prefixIcon: Icon(Icons.list),
                          labelText: "Todo"
                      ),
                      validator: (String arg) {
                        if(isTodoValid(arg))
                          return null;
                        else
                          return "enter a valid todo item.";
                      },
                      onSaved: (String val) {
                        _title = val;
                      },
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: Padding(padding: EdgeInsets.only(top: 15),
                            child: new RaisedButton (
                                elevation: 4,
                                padding: EdgeInsets.all(5),
                                child: new Text(_todoItem != null ? "Update" : "Submit"),
                                textColor: Colors.white,
                                onPressed: (){
                                  _validateInputs();
                                },
                                color: Colors.blueAccent,
                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0))
                            )
                        )
                    )
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      FocusScope.of(context).requestFocus(new FocusNode());

      if(_todoItem == null){
        _createTodoListScreenPresenter.createTodoItem(_title);
      }else{
        _todoItem.title = _title;
        _createTodoListScreenPresenter.editTodoItem(_todoItem);
      }

    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }


  @override
  void todoListAdded() {
    Navigator.of(context).pop();
  }

  @override
  void todoUpdated() {
    Navigator.of(context).pop();
  }
}