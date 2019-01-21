
import 'package:flutter_mvp_app/base/base_mvp_presenter.dart';
import 'package:flutter_mvp_app/base/base_view.dart';

abstract class CreateAccountView extends BaseView {
  void accountCreated();
}

abstract class CreateAccountPresenter extends BaseMvpPresenter<CreateAccountView> {
  void createUserAccount(String email, String password);
}