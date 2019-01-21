import 'package:flutter_mvp_app/data/api/todo_list_api_service.dart';
import 'package:flutter_mvp_app/data/models/todo_lists/todo_list_model.dart';
import 'package:flutter_mvp_app/data/models/users/user_model.dart';
import 'package:flutter_mvp_app/ui/todo_list/todo_list_items/todo_list_items_presenter.dart';
import 'package:flutter_mvp_app/ui/user/authentication/authentication_presenter.dart';
import 'package:flutter_mvp_app/ui/user/create_account/create_account_presenter.dart';

class Injector {

  /// For this particular project this class serves as our dependency injector class.
  /// Read more about dependency injection here http://www.vogella.com/tutorials/DependencyInjection/article.html
  /// There are so many other ways to actually do dependency injection. This is just a basic way that suits this demo

  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  TodoListApiService get todoListApiService {
    return new TodoListApiService();
  }

  UserModel get userModel{
    return new UserModel(Injector().todoListApiService);
  }

  TodoListModel get todoListModel {
    return new TodoListModel(Injector().todoListApiService);
  }

  AuthenticationScreenPresenter get authenticationViewPresenter {
    return new AuthenticationScreenPresenter(Injector().userModel);
  }

  CreateAccountScreenPresenter get createAccountViewPresenter {
    return new CreateAccountScreenPresenter(Injector().userModel);
  }

  TodoListItemScreenPresenter get todoListItemScreenPresenter {
    return new TodoListItemScreenPresenter(Injector().todoListModel);
  }
}