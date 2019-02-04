import 'package:flutter_mvp_app/base/base_presenter.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list_model.dart';
import 'package:flutter_mvp_app/ui/todo_list/create_todo/create_todo_mvp.dart';

class CreateTodoListScreenPresenter extends BasePresenter<CreateTodoView> implements CreateTodoViewPresenter {

  TodoListModel _todoListModel;
  CreateTodoView _createTodoView;

  CreateTodoListScreenPresenter(this._todoListModel);

  @override
  void setView(CreateTodoView view) {
    _createTodoView = view;
  }

  @override
  void createTodoItem(String title) {
    TodoItem item = TodoItem("0",title,false);
    _todoListModel.addTodoList(item)
        .then((TodoItem item){
      _createTodoView.todoListAdded();
    }).catchError((onError){
      _createTodoView.showError(onError.toString());
    });
  }

  @override
  void editTodoItem(TodoItem todoItem) {
    _todoListModel.updateTodo(todoItem)
        .then((TodoItem item){_createTodoView.todoUpdated();
    }).catchError((onError){
      _createTodoView.showError(onError.toString());
    });
  }

}