import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mvp_app/base/base_presenter.dart';
import 'package:flutter_mvp_app/data/models/users/user_model.dart';
import 'package:flutter_mvp_app/ui/user/create_account/create_account_mvp.dart';

class CreateAccountScreenPresenter extends BasePresenter<CreateAccountView> implements CreateAccountPresenter {

  CreateAccountView _createAccountView;
  UserModel _userModel;

  CreateAccountScreenPresenter(this._userModel);

  @override
  void setView(CreateAccountView view) {
    _createAccountView = view;
  }

  @override
  void createUserAccount(String email, String password) {
    _userModel.createAccount(email, password)
        .then((FirebaseUser user){

    }).catchError((onError){
      _createAccountView.showError(onError.details);
    });
  }

}