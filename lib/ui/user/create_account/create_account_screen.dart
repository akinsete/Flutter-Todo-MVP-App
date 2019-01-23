import 'package:flutter/material.dart';
import 'package:flutter_mvp_app/base/base_state.dart';
import 'package:flutter_mvp_app/di/injection.dart';
import 'package:flutter_mvp_app/ui/user/create_account/create_account_mvp.dart';
import 'package:flutter_mvp_app/ui/user/create_account/create_account_presenter.dart';
import 'package:flutter_mvp_app/utils/utility.dart';

class CreateAccountScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return CreateAccountScreenState();
  }
}

class CreateAccountScreenState extends BaseState<CreateAccountScreen> implements CreateAccountView {

  CreateAccountScreenPresenter _createAccountScreenPresenter = Injector().createAccountViewPresenter;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name;
  String _email;
  String _password;
  bool _autoValidate = false;

  @override
  void initState() {
    super.initState();
    _createAccountScreenPresenter.setView(this);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
        color: Colors.blueAccent,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            backgroundColor: Colors.blueAccent,
            elevation: 1.0,
            automaticallyImplyLeading: true,
          ),
          backgroundColor: Colors.blueAccent,
          body:  Padding(
            padding: EdgeInsets.only(left: 40.0, right: 40.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/images/todo.png", scale: 1, height: 45),
                  SizedBox(height: 30),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:[
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.0,
                                spreadRadius: 1.0
                            )
                          ]
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Form(
                            key: _formKey,
                            autovalidate: _autoValidate,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black
                                  ),
                                  decoration: new InputDecoration(
                                      enabledBorder: const UnderlineInputBorder(borderSide: const BorderSide(color: Colors.grey, width: 0.0)),
                                      prefixIcon: Icon(Icons.person),
                                      labelText: "Name"
                                  ),
                                  validator: (String arg) {
                                    if(isValidName(arg))
                                      return null;
                                    else
                                      return "Enter a valid name";
                                  },
                                  onSaved: (String val) {
                                    _name = val;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                TextFormField(
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black
                                  ),
                                  decoration: new InputDecoration(
                                      enabledBorder: const UnderlineInputBorder(borderSide: const BorderSide(color: Colors.grey, width: 0.0)),
                                      prefixIcon: Icon(Icons.email),
                                      labelText: "Email"
                                  ),
                                  validator: (String arg) {
                                    if(isEmail(arg))
                                      return null;
                                    else
                                      return "Invalid email address";
                                  },
                                  onSaved: (String val) {
                                    _email = val;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black
                                  ),
                                  decoration: new InputDecoration(
                                      enabledBorder: const UnderlineInputBorder(borderSide: const BorderSide(color: Colors.grey, width: 0.0)),
                                      prefixIcon: Icon(Icons.security),
                                      labelText: "Password"
                                  ),
                                  onSaved: (String password){
                                    _password = password;
                                  },
                                  validator: (String arg){
                                    if(isValidPassword(arg))
                                      return null;
                                    else
                                      return "Password required";
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
                                            child: new Text("Sign Up"),
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
                      )
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      FocusScope.of(context).requestFocus(new FocusNode());

      _createAccountScreenPresenter.createUserAccount(_name, _email, _password);

    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  void accountCreated() {
    gotoDashboard();
  }


}