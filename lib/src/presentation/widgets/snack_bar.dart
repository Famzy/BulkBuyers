import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

showCartSnak(
    {String msg, var scaffoldKey, int duration = 2, bool flag = true, Color color = primarySwatch}) {
  scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Text(
      msg,
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: (flag) ? color : Colors.red[500],
    action: SnackBarAction(
        label: '',
        textColor: whiteSwatch,
        onPressed: () {
          print("test");
        }),
    duration: Duration(seconds: duration),
  ));
}
