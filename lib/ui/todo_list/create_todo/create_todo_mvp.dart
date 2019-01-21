import 'package:flutter_mvp_app/base/base_mvp_presenter.dart';
import 'package:flutter_mvp_app/base/base_view.dart';

abstract class CreateTodoView extends BaseView {
  void todoListAdded();
}


abstract class CreateTodoViewPresenter extends BaseMvpPresenter<CreateTodoView> {
  void createTodoItem(String title);
}