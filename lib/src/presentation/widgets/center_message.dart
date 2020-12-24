import 'package:bulk_buyers/core/utils/theme/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget getCenteredViewMessage(BuildContext context, String message,
    {bool error = false, String json}) {
  return Center(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              error
                  ? Container(height: 150, child: Lottie.asset(json))
                  : Container(),
              Text(
                message,
                style: viewErrorTitle,
                textAlign: TextAlign.center,
              ),
            ],
          )));
}

Widget noDataUi(BuildContext context,
    {String json = 'assets/lottie/cancel_order.json',
    String text = "No data available yet"}) {
  return getCenteredViewMessage(context, text, json: json, error: true);
}

Widget errorUi(
  BuildContext context,
) {
  return getCenteredViewMessage(
      context, "Error retrieving your data. Tap to try again",
      error: true);
}

Widget getLoadingUi(
    {BuildContext context, String lottie = "laundry_loading.json"}) {
  return Center(
      child: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
      Text('Fetching data ...')
    ],
  ));
}
