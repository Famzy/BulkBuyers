import 'package:bulk_buyers/src/ui/shared/font_styles.dart';
import 'package:bulk_buyers/src/ui/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/ui/views/auth/login_view.dart';
import 'package:bulk_buyers/src/ui/views/auth/password_rest_confirmation_view.dart';
import 'package:bulk_buyers/src/ui/widgets/busy_overlay.dart';
import 'package:flutter/material.dart';
import 'package:bulk_buyers/src/scoped_models/auth/forgot_password_view_model.dart';
import 'package:bulk_buyers/src/ui/views/base_view.dart';
import 'package:lottie/lottie.dart';

class ForgotPasswordView extends StatelessWidget {
  TextEditingController forgotPassswordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BaseView<ForgotPasswordViewModel>(
        builder: (context, child, model) => Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Stack(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          UIHelper.verticalSpace(80.0),
                          Center(
                            child: UIHelper.appLogo(fit: BoxFit.cover),
                          ),
                          UIHelper.verticalSpaceSmall(),
                          UIHelper.pageTitle(title: "Forgot Password"),
                          UIHelper.verticalSpaceLarge(),
                          UIHelper.inputFormField(
                              validationMessage: model.emailError,
                              controller: forgotPassswordController,
                              placeholder: "Enter Email"),
                          UIHelper.verticalSpace(5.0),
                          UIHelper.descriptionText(
                              title: "Please Ensure you use the right email",
                              onTap: null),
                          UIHelper.verticalSpaceSmall(),
                          _getLoginButton(context, model),
                          UIHelper.verticalSpaceSmaller(),
                          _getFeedbackUI(context, model),
//                  UIHelper.fullScreenButton(title: "Email Password"),
                          UIHelper.verticalSpaceSmaller(),
                          UIHelper.formLInkText(
                              title: "I Think I remeber my password",
                              onTap: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => LoginView()),
                                    (Route<dynamic> route) => false);
                              })
                        ],
                      ),
                    ],
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
            ])));
  }

  Widget _getLoginButton(BuildContext context, ForgotPasswordViewModel model) {
    return UIHelper.fullScreenButton(
        title: "Email Password",
        onTap: () async {
          if (await model.emailValid(forgotPassswordController.text)) {
            print(await model.emailValid(forgotPassswordController.text));
            var viewState =
                await model.passwordReset(forgotPassswordController.text);
            if (viewState == 200) {
              print("This is block ran");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResetConfrimation()));
            } else {
              print(await model.emailValid(forgotPassswordController.text));
            }
          }
          return null;
        });
  }

  Widget _getFeedbackUI(BuildContext context, ForgotPasswordViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
        return Center(
            child: Text(
              '',
              style: formTextError,
            ));
      case ViewState.Error:
        return Center(
            child: Text(
          'Could not log in at this moment',
          style: formTextError,
        ));
      case ViewState.Success:
        {
          return Center(
              child: Text(
            'Kindly check your eamil for a rest link',
            style: formTextSucces,
          ));
        }
        break;
      case ViewState.WaitingForInput:
      default:
        return Container();
    }
  }
}
