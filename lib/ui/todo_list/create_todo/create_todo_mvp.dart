import 'package:flutter_mvp_app/base/base_mvp_presenter.dart';
import 'package:flutter_mvp_app/base/base_view.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list.dart';

abstract class CreateTodoView extends BaseView {
  void todoListAdded();
  void todoUpdated();
}


abstract class CreateTodoViewPresenter extends BaseMvpPresenter<CreateTodoView> {
  void createTodoItem(String title);
  void editTodoItem(TodoItem todoItem);
}