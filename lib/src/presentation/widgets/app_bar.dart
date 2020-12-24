import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

Widget appBar({@required BuildContext context,@required var scaffoldKey}) {
  return AppBar(
    backgroundColor: Colors.black,
    leading: GestureDetector(
      onTap: () => scaffoldKey.currentState.openDrawer(),
      child: Image.asset(
        "assets/images/icon-ios-menu.png",
      ),
    ),
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("assets/images/icon.png"),
      )
    ],
  );
}

Widget backAppBar({@required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.black,
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("assets/images/icon.png"),
      )
    ],
  );
}
