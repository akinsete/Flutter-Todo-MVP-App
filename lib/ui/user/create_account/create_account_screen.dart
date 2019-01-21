import 'package:flutter/material.dart';
import 'package:flutter_mvp_app/base/base_state.dart';
import 'package:flutter_mvp_app/ui/user/create_account/create_account_mvp.dart';

class CreateAccountScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return CreateAccountScreenState();
  }
}

class CreateAccountScreenState extends BaseState<CreateAccountScreen> implements CreateAccountView {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.blue,
    );
  }

  @override
  void accountCreated() {
    // TODO: implement accountCreated
  }


}