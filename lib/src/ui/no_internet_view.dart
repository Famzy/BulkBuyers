import 'dart:async';

import 'package:bulk_buyers/src/ui/shared/ui_helpers.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'views/network_splash_screen.dart';
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Center(
            child: Container(
            height: 300,
            child: Lottie.asset('assets/lottie/no_network.json')),
          ),
            Text("An internet error occurred. please try again"),

            UIHelper.verticalSpaceSmall(),
            Container(
              width: MediaQuery.of(context).size.width,
              child: FlatButton(
                color: Colors.grey,
                child: Text("Try Again"),
                onPressed:()=> Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 350),
                        pageBuilder: (context, _, __) => NetworkSplashScreen())),
              ),
            )

          ],
        ),
      ),
    );
  }
}
