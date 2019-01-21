import 'package:flutter_mvp_app/base/base_presenter.dart';
import 'package:flutter_mvp_app/data/models/users/user_model.dart';
import 'package:flutter_mvp_app/ui/user/authentication/authentication_mvp.dart';

class AuthenticationScreenPresenter extends BasePresenter<AuthenticationView> implements AuthenticationPresenter {

  /// This presenter class handles interaction between the authentication view and models.

  AuthenticationView _authenticationView;
  UserModel _userModel;

  AuthenticationScreenPresenter(this._userModel);

  @override
  void setView(AuthenticationView view) {
    _authenticationView = view;
  }

  @override
  void loginUser(String email, String password) {
    _userModel.authenticateUser(email, password)
        .then((userId){
          if(userId != null){
            view.loginSuccessful();
          }
    }).catchError((onError){
      _authenticationView.showError(onError.details);
    });
  }

  @override
  void removeView() {
    _authenticationView = null;
  }

}