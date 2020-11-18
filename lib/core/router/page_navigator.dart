import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

navigation() async {
  String status;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  String state = sharedPreferences.getString("state");

  if (state == null) {
    status = Router.welcome;
  } else {
    switch (state) {
      case "IS_VERIFIED":
        status = Router.networkSplashScreen;
        break;
      case "UserStatus.LOGGED_OUT":
        status = Router.loginView;
        break;
      default:
        status = Router.welcome;
    }
  }
  return status;
}
