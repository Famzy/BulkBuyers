import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/core/utils/bulk_buyers_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

navigation() async {
  String status;
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  String state = sharedPreferences.getString(BCStrings.CACHE_STATE);

  if (state == null) {
    status = Router.welcome;
  } else {
    switch (state) {
      case BCStrings.IS_VERIFIED:
        status = Router.networkSplashScreen;
        break;
      case BCStrings.LOGGED_OUT:
        status = Router.loginView;
        break;
      default:
        status = Router.welcome;
    }
  }
  return status;
}
