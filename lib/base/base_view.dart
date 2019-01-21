abstract class BaseView {

  void showError(String message);

  void showLoading(String message);

  void onUnknownError(String errorMessage);

  void showAlertDialog(String title, String body,String positiveBth);
}