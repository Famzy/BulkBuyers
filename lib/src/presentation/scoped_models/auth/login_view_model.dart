import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/core/utils/string_utils.dart';
import 'package:bulk_buyers/src/data/models/login_model.dart';
import 'package:bulk_buyers/src/domain/usecase/auth_usecase.dart';
import 'package:meta/meta.dart';
import '../base_model.dart';

export 'package:bulk_buyers/core/enums/view_state.dart';

class LoginViewModel extends BaseModel {
  final AuthUC authUC;
  String emailError = "";
  bool isVisible = true;
  String authErr = "";
  bool showEmailErr = false;
  LoginViewModel({@required AuthUC auth})
      : assert(auth != null),
        authUC = auth;

  Future<bool> login({String email, String password}) async {
    setState(ViewState.Busy);
    try {
      final response = await authUC.login(LoginModel(
        email: email,
        password: password,
      ));
      print("thar: $response");
      setState(ViewState.Success);
      Router.navigator
          .pushNamedAndRemoveUntil(Router.authenticated, (route) => false);
      return false;
    } catch (e) {
      print("this: $e");
      setState(ViewState.Error);
      authErr = "Check Internet Connection";
      return true;
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
