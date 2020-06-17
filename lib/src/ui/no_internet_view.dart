import 'dart:async';

import 'package:bulk_buyers/src/ui/shared/ui_helpers.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'views/store/shop_view.dart';

class NoInternetView extends StatefulWidget {
  @override
  _NoInternetViewState createState() => _NoInternetViewState();
}

class _NoInternetViewState extends State<NoInternetView> {
  StreamSubscription<DataConnectionStatus> listener;

  checkInternet() async{
    print("The statement 'this machine is connected to the Internet' is: ");
    print(await DataConnectionChecker().hasConnection);

    print("Current status: ${await DataConnectionChecker().connectionStatus}");
    print("Last results: ${DataConnectionChecker().lastTryResults}");

    listener = DataConnectionChecker().onStatusChange.listen((status) async {
      switch (status) {
        case DataConnectionStatus.connected:
          setState(() {
            Navigator.pop(context);

          });

          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          break;
      }
    });

    // close listener after 30 seconds, so the program doesn't run forever
    await Future.delayed(Duration(seconds: 300));
    await listener.cancel();
  }
  @override
  void initState() {
    checkInternet();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Ooops You are disconnected"),
        Center(
          child: Container(
          height: 300,
          child: Lottie.asset('assets/lottie/no_network.json')),
        ),

          UIHelper.verticalSpaceSmall(),
          Icon(Icons.refresh, size: 40,),
          Text("Retry"),
        ],
      ),
    );
  }
}
