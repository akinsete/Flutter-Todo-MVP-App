import 'package:flutter_mvp_app/base/base_view.dart';

abstract class  BaseMvpPresenter<V extends BaseView> {


  void setView(V view);


  void removeView();


  bool isAttached();
  
}