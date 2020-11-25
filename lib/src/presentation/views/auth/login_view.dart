import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/core/utils/string_utils.dart';
import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/core/utils/theme/ui_reducers.dart';
import 'package:bulk_buyers/src/presentation/scoped_models/auth/login_view_model.dart';
import 'package:bulk_buyers/src/presentation/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/presentation/widgets/busy_overlay.dart';
import 'package:bulk_buyers/src/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../base_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        builder: (context, child, model) => BusyOverlay(
              show: model.state == ViewState.Busy,
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: whiteSwatch,
                body: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Form(
                    key: _formKey,
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
                              placeholder: 'Enter Email',
                              controller: emailController,
                              validator: (val) {
                                if (val.length == 0) {
                                  return "Email cannot be empty";
                                } else if (!StringUtils.isValidEmail(
                                    emailController.text)) {
                                  return "Please Enter a valid email";
                                } else {
                                  return null;
                                }
                              },
                              keyboard: TextInputType.emailAddress),
                          UIHelper.verticalSpaceSmall(),
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
                              validator: (val) {
                                if (val.length == 0) {
                                  return "Password cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              isPassword: model.isVisible,
                              controller: passwordController),
                          UIHelper.verticalSpace(screenHeight(context) / 25),
                          UIHelper.fullScreenButton(
                              title: "LOGIN",
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                if (_formKey.currentState.validate()) {
                                  final response = await model.login(
                                      email: emailController.text,
                                      password: passwordController.text);
                                  response
                                      ? showCartSnak(
                                          color: graySwatch,
                                          msg: model.authErr,
                                          duration: 10,
                                          scaffoldKey: scaffoldKey)
                                      : Container();
                                }
                              }),
                          UIHelper.verticalSpace(10),
                          UIHelper.verticalSpaceSmaller(),
                          UIHelper.formLInkText(
                              title: "Forgot Password?",
                              onTap: () => Router.navigator
                                  .pushNamed(Router.forgotPassword)),
                          UIHelper.verticalSpaceSmaller(),
                          UIHelper.formLInkText(
                              title: "Don\'t have account? Create one now!",
                              onTap: () =>
                                  Router.navigator.pushNamed(Router.signUp)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
