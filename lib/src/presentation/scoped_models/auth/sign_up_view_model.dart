export 'package:bulk_buyers/core/enums/view_state.dart';
import 'package:bulk_buyers/core/error/exceptions.dart';
import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/core/utils/bulk_buyers_strings.dart';
import 'package:bulk_buyers/core/utils/string_utils.dart';
import 'package:bulk_buyers/src/data/models/registration_model.dart';
import 'package:bulk_buyers/src/domain/usecase/auth_usecase.dart';
import 'package:meta/meta.dart';

import '../base_model.dart';

class SignUpViewModel extends BaseModel {
  String emailError;
  String phoneError;
  bool terms = false;
  bool isVisible = true;
  String authErr = "";
  final AuthUC authUC;

  SignUpViewModel({@required AuthUC auth})
      : assert(auth != null),
        authUC = auth;

  Future<bool> signUpUser(String firstName, String lastName, String password,
      String email, String phone) async {
        emailError = null;
        phoneError = null;
    setState(ViewState.Busy);
    try {
      final response = await authUC.register(RegisterModel(
        email: email,
        password: password,
        lname: lastName,
        fname: firstName,
        phone: phone,
      ));
      Router.navigator.pushReplacementNamed(Router.verifyEmail);
      //TODO: REMEBER TO RETURN THE 404 ERROR MESSAGE AS AN ERROR WHEN THE SERVER RETURNS 404
    } catch (e) {
    switch(e){
      case NetworkException:
      setState(ViewState.Error);
      authErr = "Check Internet Connection";
      return true;
      case ServerException:
      authErr = e;
      return true;
      default:
      authErr = BCStrings.sthWentWrong;
      return true;
    }
    }
      }
    Future<bool> correctEmail(String email) async {
      bool valid = StringUtils.isValidEmail(email);
      if (valid == false) {
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

