import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/src/presentation/scoped_models/welcome_view_model.dart';
import 'package:bulk_buyers/src/presentation/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/presentation/views/base_view.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<WelcomeViewModel>(
      builder: (context, child, model) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/welcome-bg.jpg'),
          )),
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 227,
                        height: 108,
                        margin: EdgeInsets.only(top: 80),
                        child: UIHelper.appLogo(fit: BoxFit.cover),
                      ),
                    ),
                    UIHelper.verticalSpaceMedium(),
                    Container(
                      width: 272,
                      child: Text(
                        "Buy groceries in bulk at 10% - 25% below market price",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 24,
                          fontFamily: "Roboto",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    UIHelper.verticalSpaceMedium(),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 500,
                        height: 50,
                        margin: EdgeInsets.only(bottom: 20),
                        child: RaisedButton(
                          onPressed: () => Router.navigator
                              .pushReplacementNamed(Router.loginView),
                          color: Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          textColor: Color.fromARGB(255, 0, 0, 0),
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Roboto",
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 500,
                        height: 50,
                        child: ButtonTheme(
                          minWidth: double.infinity,
                          child: FlatButton(
                            onPressed: () => Router.navigator
                                .pushReplacementNamed(Router.signUp),
                            color: Color.fromARGB(255, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                            ),
                            textColor: Color.fromARGB(255, 255, 255, 255),
                            padding: EdgeInsets.all(0),
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Roboto",
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
