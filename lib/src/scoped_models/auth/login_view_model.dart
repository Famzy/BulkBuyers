import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/src/models/login_model.dart';
import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:bulk_buyers/src/utils/string_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../base_model.dart';

export 'package:bulk_buyers/src/enums/view_state.dart';

class LoginViewModel extends BaseModel {
  String emailError = "";
  bool isVisible = true;
  String authErr = "";
  bool showEmailErr = false;
  final _root = Constants.BASE_URL;
  final HttpClient client = new HttpClient();
  shop() {
    setState(ViewState.WaitingForInput);
  }

  Future<bool> login({String email, String password}) async {
    setState(ViewState.Busy);
    await Future.delayed(Duration(seconds: 3));
    try {
      Login login = Login(email: email, password: password);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var loginFields = login.toJson();
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      String url = "$_root/access";
      HttpClientRequest request = await client.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(loginFields)));

      HttpClientResponse response = await request.close();
      int status = await response.statusCode;
      String reply = await response.transform(utf8.decoder).join();
      switch (status) {
        case HttpStatus.ok:
          var loginResult = true;
          var token = json.decode(reply);
          sharedPreferences.setString("token", token['token']);
          sharedPreferences.setString("state", "false");
          sharedPreferences.setString("email", email);
          var loginStateBasedOnReponse =
              loginResult ? ViewState.Success : ViewState.Error;
          setState(loginStateBasedOnReponse);
          return loginResult;
          break;

        case HttpStatus.unauthorized:
          var error = json.decode(reply);
          authErr = "Wrong Email or Password";
          var loginResult = false;
          var loginStateBasedOnReponse =
              loginResult ? ViewState.Success : ViewState.NoDataAvailable;
          setState(loginStateBasedOnReponse);
          return loginResult;
          break;
        default:
          var loginResult = false;
          var loginStateBasedOnReponse =
              loginResult ? ViewState.Success : ViewState.Error;
          setState(loginStateBasedOnReponse);
          return loginResult;
      }
    } catch (exeption) {
      setState(ViewState.Error);
      throw "No network";
    }
  }

  passwordToggle() {
    isVisible = !isVisible;
    notifyListeners();
  }

  Future<bool> correctEmail(String email) async {
    bool valid = StringUtils.isValidEmail(email);
    emailError = valid ? "" : "Invalid email format";
    notifyListeners();
    return valid;
  }
}
