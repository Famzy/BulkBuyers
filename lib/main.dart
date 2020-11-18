import 'dart:io';

import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:async/async.dart';

import './service_locator.dart';
import 'core/router/page_navigator.dart';
import 'core/utils/theme/app_colors.dart';
import 'src/data/datasource/remote/services/http_overide.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String value = await navigation();
  // Register all the models and services before the app starts
  setupLocator();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp(
    isAthenicated: value,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatefulWidget {
  MyApp({this.isAthenicated});
  static AsyncMemoizer apiMemo = new AsyncMemoizer();
  String isAthenicated;

  @override
  _MyAppState createState() => _MyAppState(isAthenicated: isAthenicated);
}

class _MyAppState extends State<MyApp> {
  AppUpdateInfo _updateInfo;
  String isAthenicated;

  _MyAppState({this.isAthenicated});

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

// Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e) => _showError(e));
    this.performUpdate();
  }

  void _showError(dynamic exception) {
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text(exception.toString())));
  }

  performUpdate() {
    _updateInfo?.updateAvailable == true
        ? () {
            InAppUpdate.performImmediateUpdate()
                .catchError((e) => _showError(e));
          }
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bulk Buyers',
      theme: ThemeData(
          primaryColor: primarySwatch,
          canvasColor: Color.fromARGB(242, 243, 243, 243),
          backgroundColor: whiteSwatch,
          bottomAppBarTheme:
              BottomAppBarTheme(elevation: 0, color: Colors.blue)),
      navigatorKey: Router.navigatorKey,
      onGenerateRoute: Router.onGenerateRoute,
      initialRoute: isAthenicated,
    );
  }

  @override
  void initState() {
    checkForUpdate();
    super.initState();
  }
}
