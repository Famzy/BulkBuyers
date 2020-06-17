import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/src/data/remote/model/store_api_provider.dart';
import 'package:bulk_buyers/src/models/registration_model.dart';
import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:bulk_buyers/src/utils/string_utils.dart';

import '../base_model.dart';

export 'package:bulk_buyers/src/enums/view_state.dart';

var api = ApiProvider();

class SignUpViewModel extends BaseModel {
  final _root = Constants.BASE_URL;
  final HttpClient client = new HttpClient();
  String emailError = "";
  String phoneError = "";
  var error;
  bool terms = false;

  Future<bool> signUpUser(String firstName, String lastName, String password,
      String email, String phone) async {
    setState(ViewState.Busy);
    try {
      Register register = Register(
          email: email,
          password: password,
          lname: lastName,
          phone: phone,
          fname: firstName);
      var rigisterFields = register.toJson();

      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      String url = "$_root/register";
      HttpClientRequest request = await client.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(rigisterFields)));

      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      var signUpRes = json.decode(reply);

      int status = await response.statusCode;
      switch (status) {
        case HttpStatus.ok:
          var signUpResponse = true;
          var signupStateBasedOnResponse =
              signUpResponse ? ViewState.Success : ViewState.Error;
          setState(signupStateBasedOnResponse);
          return signUpResponse;
          break;
        case HttpStatus.unauthorized:
          var signUpResponse = false;

          error = signUpRes['errors'];
          emailError = error['email'].toString();
          phoneError = error['phone'].toString();
          notifyListeners();
          var signupStateBasedOnResponse =
              signUpResponse ? ViewState.Success : ViewState.Error;
          setState(signupStateBasedOnResponse);
          return signUpResponse;
          break;
      }
    } on SocketException {
      setState(ViewState.NoDataAvailable);
    } catch (e) {
      setState(ViewState.Error);
      throw("No Network");
    }
  }

  Future<bool> correctEmail(String email) async {
    bool valid = StringUtils.isValidEmail(email);
    if(valid == false){
      emailError = "Invalid Email format";
      notifyListeners();
    }

    return valid;
  }

  String checkConfirmationPasswordValid(
      {String password, String confirmationPassword}) {
    if (password != confirmationPassword) {
      return 'Please confirm that your passwords are the same';
    }
    return null;
  }

  void acceptTerms(bool newValue) {
    terms = newValue;
    notifyListeners();
  }
}
