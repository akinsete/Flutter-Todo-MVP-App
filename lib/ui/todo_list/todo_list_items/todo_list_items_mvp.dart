import 'package:flutter_mvp_app/base/base_mvp_presenter.dart';
import 'package:flutter_mvp_app/base/base_view.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list.dart';

abstract class TodoListItemView extends BaseView {
  void updateItemList(List<TodoItem> todoLists);
  void signOutCompleted();
}


abstract class TodoListItemPresenter extends BaseMvpPresenter<TodoListItemView> {
  void getTodoList();
  void signOut();
  void setTodoStatus(id,done);
  void removeTodo(id);
}