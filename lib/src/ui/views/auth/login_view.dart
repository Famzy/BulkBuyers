import 'package:bulk_buyers/src/scoped_models/auth/login_view_model.dart';
import 'package:bulk_buyers/src/ui/shared/app_colors.dart';
import 'package:bulk_buyers/src/ui/shared/font_styles.dart';
import 'package:bulk_buyers/src/ui/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/ui/views/auth/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../authenticated_view.dart';
import '../base_view.dart';
import 'forgot_password_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BaseView<LoginViewModel>(
        onModelReady: (model) => model.shop(),
        builder: (context, child, model) => Stack(
              children: <Widget>[
                Scaffold(
                  backgroundColor: whiteSwatch,
                  body: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Container(
                      padding: EdgeInsets.all(15.0),
                      margin: EdgeInsets.only(top: 50.0),
                      child: ListView(
                        children: <Widget>[
                          UIHelper.appLogo(),
                          UIHelper.pageTitle(title: "Login"),
                          UIHelper.verticalSpaceLarge(),
                          UIHelper.inputFormField(
                              validationMessage: model.emailError,
                              placeholder: 'Enter username',
                              controller: emailController,
                              keyboard: TextInputType.emailAddress),
                          UIHelper.verticalSpaceMedium(),
                          UIHelper.inputFormField(
                              placeholder: 'Enter password',
                              icon: IconButton(
                                  icon: model.isVisible
                                      ? SvgPicture.asset('assets/svgs/eye.svg')
                                      : SvgPicture.asset(
                                          'assets/svgs/eye.svg',
                                          color: primarySwatch,
                                        ),
                                  onPressed: model.passwordToggle),
                              isPassword: model.isVisible,
                              controller: passwordController),
                          UIHelper.verticalSpace(10),
                          _getFeedbackUI(model),
                          UIHelper.verticalSpace(10),
                          _getLoginButton(model),
                          UIHelper.verticalSpaceSmaller(),
                          UIHelper.formLInkText(
                              title: "Forgot Password?",
                              onTap: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordView()),
                                    (Route<dynamic> route) => false);
                              }),
                          UIHelper.verticalSpaceSmaller(),
                          UIHelper.formLInkText(
                              title: "Don\'t have account? Create one now!",
                              onTap: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => SignUpView()),
                                    (Route<dynamic> route) => false);
                              }),
                        ],
                      ),
                    ),
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
            ));
  }

  Widget _getLoginButton(LoginViewModel model) {
    return UIHelper.fullScreenButton(
        title: "Login",
        onTap: () async {
          print("${emailController.text}  ${passwordController.text}");
          if(await model.correctEmail(emailController.text)){
            bool viewState = await model.login(
                email: emailController.text, password: passwordController.text);

            //print(viewState.toString());
            //int res = json.decode(viewState);
            print("this is the Res Item returned: $viewState");
            if (viewState) {
              print("This is block ran");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AuthenticatedView()));
            } else {}
          }
          else{
            return null;
          }
        });
  }

  Widget _getFeedbackUI(LoginViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
        return Center(
            child: Text("",
              style: formTextError,
            ));
//      case ViewState.Busy:
//        return Center(
//          child: Lottie.asset('assets/lottie/loader.json', height: 100),
//        );
//        break;

      case ViewState.Error:
        return Center(
            child: Text(
          'Could not log in at this moment check internet connection',
          style: formTextError,
        ));

      case ViewState.NoDataAvailable:
        return Center(
            child: Text(
          model.authErr,
          style: formTextError,
        ));
      case ViewState.Success:
        {
          return Center(
              child: Text(
            'Login Success',
            style: formTextSucces,
          ));
        }
        break;
      case ViewState.WaitingForInput:

      default:
        return Container(
          height: 4,
        );
    }
  }
}
