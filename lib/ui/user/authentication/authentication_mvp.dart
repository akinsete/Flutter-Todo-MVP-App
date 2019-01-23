import 'package:flutter_mvp_app/base/base_mvp_presenter.dart';
import 'package:flutter_mvp_app/base/base_view.dart';

abstract class AuthenticationView extends BaseView {
  void loginSuccessful();
}


abstract class AuthenticationPresenter extends BaseMvpPresenter<AuthenticationView> {
  void authenticateUser(String email, String password);
}