import 'package:flutter/material.dart';
import 'package:flutter_mvp_app/base/base_state.dart';
import 'package:flutter_mvp_app/di/injection.dart';
import 'package:flutter_mvp_app/ui/todo_list/create_todo/create_todo_mvp.dart';
import 'package:flutter_mvp_app/ui/todo_list/create_todo/create_todo_presenter.dart';
import 'package:flutter_mvp_app/utils/utility.dart';

class CreateTodoListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CreateTodoListScreenState();
  }

}

class CreateTodoListScreenState extends BaseState<CreateTodoListScreen> implements CreateTodoView {

  CreateTodoListScreenPresenter _createTodoListScreenPresenter = Injector().createTodoListScreenPresenter;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _title;
  bool _autoValidate = false;

  @override
  void initState() {
    super.initState();

    _createTodoListScreenPresenter.setView(this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          automaticallyImplyLeading: true,
          title: Text("Create Todo", style: TextStyle(color: Colors.black)),
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
                                child: new Text("Create"),
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

      _createTodoListScreenPresenter.createTodoItem(_title);

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
}