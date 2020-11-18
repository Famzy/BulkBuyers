import 'package:bulk_buyers/core/utils/theme/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget getCenteredViewMessage(BuildContext context, String message,
    {bool error = false}) {
  return Center(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                message,
                style: viewErrorTitle,
                textAlign: TextAlign.center,
              ),
              error
                  ? Icon(
                      // WWrap in gesture detector and call you refresh future here
                      Icons.refresh,
                      color: Colors.white,
                      size: 45.0,
                    )
                  : Container()
            ],
          )));
}

Widget noDataUi(
  BuildContext context,
) {
  return getCenteredViewMessage(context, "No data available yet");
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
