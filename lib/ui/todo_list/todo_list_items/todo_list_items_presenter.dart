import 'package:flutter_mvp_app/base/base_presenter.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list_model.dart';
import 'package:flutter_mvp_app/ui/todo_list/todo_list_items/todo_list_items_mvp.dart';

class TodoListItemScreenPresenter extends BasePresenter<TodoListItemView> implements TodoListItemPresenter {

  TodoListItemView _todoListItemView;
  TodoListModel _todoListModel;

  TodoListItemScreenPresenter(this._todoListModel);

  @override
  void getTodoList() {
    _todoListModel
        .getTodoList()
        .then((List<TodoItem> items){

        _todoListItemView.updateItemList(items);

    }).catchError((error){
        _todoListItemView.showError(error.details);
    });
  }


  @override
  void removeView() {
    _todoListItemView = null;
  }
}