import 'dart:async';

import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/src/presentation/scoped_models/store/shop_view_model.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'base_view.dart';

class NetworkSplashScreen extends StatefulWidget {
  @override
  _NetworkSplashScreenState createState() => _NetworkSplashScreenState();
}

class _NetworkSplashScreenState extends State<NetworkSplashScreen> {
  bool action = false;
  StreamSubscription<DataConnectionStatus> listener;
  @override
  void initState() {
    super.initState();
    checkInternet();
//    navigate(model);
  }

  @override
  void dispose() {
    listener.cancel();
    super.dispose();
  }

  checkInternet() async {
    print("The statement 'this machine is connected to the Internet' is: ");
    print(await DataConnectionChecker().hasConnection);

    print("Current status: ${await DataConnectionChecker().connectionStatus}");
    print("Last results: ${DataConnectionChecker().lastTryResults}");

    listener = DataConnectionChecker().onStatusChange.listen((status) async {
      switch (status) {
        case DataConnectionStatus.connected:
          print('Data connection is available.');
          //  await model.refresh();
          setState(() {
            Router.navigator
                .pushNamedAndRemoveUntil(Router.container, (route) => false);
          });
          print("i don pass ooo");
          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          setState(() {
            Router.navigator.pushNamed(Router.noInternet);
          });
          break;
      }
    });

    // close listener after 30 seconds, so the program doesn't run forever
    await Future.delayed(Duration(seconds: 300));
    await listener.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ShopViewModel>(
//      onModelReady: (model) => model.refresh(),
      builder: (context, child, model) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Image.asset('assets/images/logo.png')),
            //  UIHelper.verticalSpace(MediaQuery.of(context).size.height / 6),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                      height: 60,
                      child: Lottie.asset('assets/lottie/loading_check.json')),
                  Text("Please wait while we update your product list")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
