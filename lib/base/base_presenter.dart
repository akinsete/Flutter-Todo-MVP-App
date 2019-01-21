import 'package:flutter_mvp_app/base/base_mvp_presenter.dart';
import 'package:flutter_mvp_app/base/base_view.dart';

class BasePresenter<V extends BaseView> implements BaseMvpPresenter<V> {

  V view;
  @override
  bool isAttached() {
    // TODO: implement isAttached
    return view != null;
  }

  @override
  void removeView() {
    view = null;
  }

  @override
  void setView(V view) {
    this.view = view;
  }


}
