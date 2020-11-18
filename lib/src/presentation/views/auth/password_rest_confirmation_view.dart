import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/core/utils/theme/font_styles.dart';
import 'package:bulk_buyers/src/presentation/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

import 'login_view.dart';

class ResetConfrimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Image.asset(
          "assets/images/icon-ios-menu.png",
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/icon.png"),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          UIHelper.verticalSpaceMedium(),
          Center(child: UIHelper.confirm()),
          UIHelper.verticalSpaceSmall(),
          Center(
            child: Text("RESET LINK SENT", style: subHeading2),
          ),
          UIHelper.verticalSpaceSmall(),
          Center(
            child: Text(
              "Please go to your email box and \n click on the reset link  that was \n sent to you.",
              textAlign: TextAlign.center,
              style: subHeading3,
            ),
          ),
          UIHelper.verticalSpaceLarge(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 300,
              height: 40,
              margin: EdgeInsets.only(bottom: 20),
              child: RaisedButton(
                onPressed: () {
                  Router.navigator.pushNamedAndRemoveUntil(
                      Router.loginView, (route) => false);
                },
                color: primarySwatch,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                textColor: Color.fromARGB(255, 0, 0, 0),
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "LOGIN TO CONTINUE",
                  style: TextStyle(
                      fontSize: 12, fontFamily: "Roboto", color: whiteSwatch),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
