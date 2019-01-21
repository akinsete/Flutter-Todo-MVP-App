import 'package:flutter/material.dart';
import 'package:flutter_mvp_app/base/base_state.dart';
import 'package:flutter_mvp_app/ui/user/authentication/authentication_mvp.dart';

class AuthenticationScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return AuthenticationScreenState();
  }
}

class AuthenticationScreenState extends BaseState<AuthenticationScreen> implements AuthenticationView {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.red,
    );
  }


  @override
  void loginSuccessful() {
    // TODO: implement loginSuccessful
  }


}