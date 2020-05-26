
import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:bulk_buyers/src/utils/string_utils.dart';

import '../base_model.dart';
import 'package:http/http.dart' show post;

export 'package:bulk_buyers/src/enums/view_state.dart';
class ForgotPasswordViewModel extends BaseModel {
  String emailError = "";
  bool isValidEmail = false;
  //Client client = Client();
  final _root = Constants.BASE_URL;

  passwordReset(String email) async {
    setState(ViewState.Busy);
    Map details = {'email': email};
    print(details);
    try {

      var response = await post('$_root/user/reset', body: details, headers: {
      "Accept":"application/json"
      });
      print("this is the response: ${response.statusCode}");
      if(response.statusCode == 200){
        print(response.body);
        reset(true);
      }
      return response.statusCode;
    } catch (exeption) {
      setState(ViewState.Error);
      print(exeption);
    }
  }
  Future<bool> reset(bool valid) async {
    await Future.delayed(Duration(seconds: 1));
    var loginResult = valid ? true : false;

    var resetStateBasedOnReponse =
    loginResult ? ViewState.Success : ViewState.Error;

    // Update the view state based on the response
    setState(resetStateBasedOnReponse);

    return true;
  }

 Future<bool>  emailValid(String email) async {
    print(email);
    bool vaild = StringUtils.isValidEmail(email);
    vaild ? emailError = "" : "Invalid email format";
    notifyListeners();
    return vaild;
  }
}
