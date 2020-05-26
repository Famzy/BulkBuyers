import 'package:bulk_buyers/src/enums/view_state.dart';
import 'package:bulk_buyers/src/scoped_models/auth/sign_up_view_model.dart';
import 'package:bulk_buyers/src/ui/shared/app_colors.dart';
import 'package:bulk_buyers/src/ui/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/ui/views/auth/verify_email_view.dart';
import 'package:bulk_buyers/src/ui/widgets/busy_overlay.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../base_view.dart';
import 'login_view.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String _passwordConfirmaionValidation;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool get _hasEnteredInformation =>
      emailController.text != '' &&
      passwordController.text != '' &&
      confirmPasswordController.text != '' &&
      firstNameController.text != '' &&
      lastNameController.text != '' &&
      phoneController.text != '';

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    return BaseView<SignUpViewModel>(
      builder: (context, child, model) => Scaffold(
        backgroundColor: whiteSwatch,
        body: Stack(
          children: <Widget>[
            Form(
              child: Container(
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.only(top: 50.0),
                child: ListView(children: <Widget>[
                  UIHelper.appLogo(),
                  UIHelper.pageTitle(title: "Sign Up"),
                  UIHelper.verticalSpaceLarge(),
                  UIHelper.inputFormField(
                    placeholder: 'First Name',
                    controller: firstNameController,
                  ),
                  UIHelper.verticalSpaceSmall(),
                  UIHelper.inputFormField(
                    placeholder: 'Last Name',
                    controller: lastNameController,
                  ),
                  UIHelper.verticalSpaceSmall(),
                  UIHelper.inputFormField(
                      placeholder: 'Email Address',
                      controller: emailController,
                      keyboard: TextInputType.emailAddress,
                      validationMessage: model.emailError),
                  UIHelper.verticalSpaceSmall(),
                  UIHelper.inputFormField(
                    placeholder: 'Phone Number',
                    controller: phoneController,
                    keyboard: TextInputType.phone,
                  ),
                  UIHelper.verticalSpaceSmall(),
                  UIHelper.inputFormField(
                      title: 'Confirm Password',
                      placeholder: 'Enter password',
                      isPassword: true,
                      controller: passwordController),
                  UIHelper.verticalSpaceSmall(),
                  UIHelper.inputFormField(
                      placeholder: 'Confirm password',
                      isPassword: true,
                      controller: confirmPasswordController,
                      validationMessage: _passwordConfirmaionValidation),
                  _getFeedbackUI(model),
                  UIHelper.verticalSpaceSmall(),
                  _getSignUpButton(model),
                  UIHelper.verticalSpaceSmall(),
                  UIHelper.formLInkText(
                      title: "I have an Account? Login here",
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginView()),
                            (Route<dynamic> route) => false);
                        print("object");
                      }),
                ]),
              ),
            ),
            IgnorePointer(
              child: Opacity(
                opacity: model.state == ViewState.Busy ? 1.0 : 00,
                child: Container(
                    width: screenSize.width,
                    height: screenSize.height,
                    child: Container(
                      width: screenSize.width,
                      height: screenSize.height,
                      alignment: Alignment.center,
                      color: Color.fromARGB(100, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Lottie.asset('assets/lottie/loading.json', height: 100),
                        ],
                      ),
                    )
                ),
              ),
            )
          ],

        ),
      ),
    );
  }

  Widget _getFeedbackUI(SignUpViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
      case ViewState.Error:
        // NOTE: Place your Login error UI here
        return Center(
            child: Text(
                'Could not sign up at this moment, check internet connection'));
      case ViewState.Success:
        // NOTE: Place your login success UI here
        return Center(child: Text('Signup Success'));
      case ViewState.WaitingForInput:
      default:
        return Container();
    }
  }

  Widget _getSignUpButton(SignUpViewModel model) {
    return UIHelper.fullScreenButton(
        title: 'SIGN UP',
        onTap: () async {
          var passwordValidationMessage = model.checkConfirmationPasswordValid(
              password: passwordController.text,
              confirmationPassword: confirmPasswordController.text);

        if (await model.correctEmail(emailController.text)){
          if (passwordValidationMessage == null && _hasEnteredInformation) {
            var viewState = await model.signUpUser(
                firstNameController.text,
                lastNameController.text,
                passwordController.text,
                emailController.text,
                phoneController.text);
            if (viewState) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VerifyEmail()));
            }
          } else {
            setState(() {
              _passwordConfirmaionValidation = passwordValidationMessage;
            });
          }
        }
        else{}
        });
  }
}

//firstName: firstNameController.text, lastName: lastNameController.text, password: passwordController.text, email: emailController.text, phone: phoneController.text
