import 'package:flutter/material.dart';
import 'package:flutter_mvp_app/base/base_state.dart';
import 'package:flutter_mvp_app/di/injection.dart';
import 'package:flutter_mvp_app/ui/user/authentication/authentication_mvp.dart';
import 'package:flutter_mvp_app/ui/user/authentication/authentication_presenter.dart';
import 'package:flutter_mvp_app/utils/utility.dart';

class AuthenticationScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return AuthenticationScreenState();
  }
}

class AuthenticationScreenState extends BaseState<AuthenticationScreen> implements AuthenticationView {

  AuthenticationScreenPresenter _authenticationScreenPresenter = Injector().authenticationViewPresenter;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  bool _autoValidate = false;



  @override
  void initState() {
    super.initState();
    _authenticationScreenPresenter.setView(this);
  }

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Material(
      color: Colors.blueAccent,
      child: Scaffold(
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
                          ),
                          SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: Padding(padding: EdgeInsets.only(top: 15),
                                  child: new RaisedButton (
                                      elevation: 4,
                                      padding: EdgeInsets.all(5),
                                      child: new Text("Login"),
                                      textColor: Colors.white,
                                      onPressed: (){
                                        _validateInputs();
                                      },
                                      color: Colors.blueAccent,
                                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0))
                                  )
                              )
                          ),
                          Padding(padding:
                            EdgeInsets.only(top: 15.0, bottom: 15.0, left: 40, right: 40),
                              child: Divider(
                                  height: 2,
                                  color: Colors.grey)
                          ),
                          SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: RaisedButton (
                                  elevation: 4,
                                  padding: EdgeInsets.all(5),
                                  child: new Text("Create Account"),
                                  textColor: Colors.white,
                                  onPressed: (){
                                    Navigator.of(context).pushNamed("/create_account");
                                  },
                                  color: Colors.blueAccent,
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25.0))
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

      _authenticationScreenPresenter.authenticateUser(_email, _password);

    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  void loginSuccessful() {
    gotoDashboard();
  }

}