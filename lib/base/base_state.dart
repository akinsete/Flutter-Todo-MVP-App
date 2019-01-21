import 'package:flutter/material.dart';
import 'package:flutter_mvp_app/base/base_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class BaseState<T> extends State implements BaseView {

  @override
  void initState() {
    super.initState();
  }

  void showErrorToast(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIos: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white
    );
  }

  void showSuccessToast(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIos: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white
    );
  }

  @override
  Future<void> showAlertDialog(String title, String body,String positiveBth) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(body)
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(positiveBth),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  void gotoDashboard(){
    Navigator.of(context).pushReplacementNamed("/dashboard");
  }


  @override
  void onUnknownError(String errorMessage) {
    showErrorToast(errorMessage);
  }

  @override
  void showError(String message) {
    showErrorToast(message);
  }

  @override
  void showLoading(String message) {
    // TODO: implement showLoading
  }

}