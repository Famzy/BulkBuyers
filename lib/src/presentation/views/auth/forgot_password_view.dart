import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/core/utils/theme/font_styles.dart';
import 'package:bulk_buyers/src/presentation/scoped_models/auth/forgot_password_view_model.dart';
import 'package:bulk_buyers/src/presentation/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/presentation/widgets/busy_overlay.dart';
import 'package:bulk_buyers/src/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';

class ForgotPasswordView extends StatelessWidget {
  TextEditingController forgotPassswordController = new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BaseView<ForgotPasswordViewModel>(
        builder: (context, child, model) => BusyOverlay(
              show: model.state == ViewState.Busy,
              child: Scaffold(
                  key: scaffoldKey,
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
                                    title:
                                        "Please Ensure you use the right email",
                                    onTap: null),
                                UIHelper.verticalSpaceSmall(),
                                _getLoginButton(context, model),
                                UIHelper.verticalSpaceSmaller(),
                                _getFeedbackUI(context, model),
//                  UIHelper.fullScreenButton(title: "Email Password"),
                                UIHelper.verticalSpaceSmaller(),
                                UIHelper.formLInkText(
                                    title: "I Think I remember my password",
                                    onTap: () => Router.navigator
                                        .pushReplacementNamed(Router.loginView))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
//              IgnorePointer(
//                child: Opacity(
//                  opacity: model.state == ViewState.Busy ? 1.0 : 00,
//                  child: Container(
//                      width: screenSize.width,
//                      height: screenSize.height,
//                      child: Container(
//                        width: screenSize.width,
//                        height: screenSize.height,
//                        alignment: Alignment.center,
//                        color: Color.fromARGB(100, 0, 0, 0),
//                        child: Column(
//                          mainAxisSize: MainAxisSize.min,
//                          children: <Widget>[
//                            Lottie.asset('assets/lottie/loading.json',
//                                height: 100),
//                          ],
//                        ),
//                      )),
//                ),
//              )
                  ])),
            ));
  }

  Widget _getLoginButton(BuildContext context, ForgotPasswordViewModel model) {
    return UIHelper.fullScreenButton(
        title: "Email Password",
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          if (await model.emailValid(forgotPassswordController.text)) {
            final response =
                await model.passwordReset(forgotPassswordController.text);
            response
                ? showCartSnak(
                    color: graySwatch,
                    msg: model.authErr,
                    duration: 10,
                    scaffoldKey: scaffoldKey)
                : Container();
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
