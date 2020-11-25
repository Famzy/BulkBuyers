import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/core/utils/string_utils.dart';
import 'package:bulk_buyers/src/data/models/registration_model.dart';
import 'package:bulk_buyers/src/domain/usecase/auth_usecase.dart';
import 'package:meta/meta.dart';
import '../base_model.dart';

export 'package:bulk_buyers/core/enums/view_state.dart';

class ForgotPasswordViewModel extends BaseModel {
  final AuthUC authUC;

  ForgotPasswordViewModel({@required AuthUC auth})
      : assert(auth != null),
        authUC = auth;

  String emailError = "";
  bool isValidEmail = false;
  String authErr = "";

  passwordReset(String email) async {
    setState(ViewState.Busy);
    try {
      final response = await authUC.reset(ResetModel(email: email));
      print(response);
      setState(ViewState.Success);
      Router.navigator
          .pushNamedAndRemoveUntil(Router.resetConfrimation, (route) => false);
      return false;
    } catch (exeption) {
      setState(ViewState.Error);
      authErr = "Check Internet Connection";
      print(exeption);
      return true;
    }
  }

  Future<bool> emailValid(String email) async {
    print(email);
    bool vaild = StringUtils.isValidEmail(email);
    vaild ? emailError = "" : "Invalid email format";
    notifyListeners();
    return vaild;
  }
}
