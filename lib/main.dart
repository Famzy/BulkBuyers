import 'dart:io';

import 'package:bulk_buyers/src/scoped_models/store/shop_view_model.dart';
import 'package:bulk_buyers/src/ui/shared/app_colors.dart';
import 'package:bulk_buyers/src/ui/views/network_splash_screen.dart';
import 'package:bulk_buyers/src/ui/views/welcome_view.dart';
import 'package:bulk_buyers/src/utils/page_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:async/async.dart';

import './service_locator.dart';

void main() async {
  // Register all the models and services before the app starts
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  bool value = await navigation();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp(
    isAthenicated: value,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class MyApp extends StatefulWidget {
  MyApp({this.isAthenicated});
  static AsyncMemoizer apiMemo = new AsyncMemoizer();
  bool isAthenicated;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppUpdateInfo _updateInfo;
  ShopViewModel shopViewModel = ShopViewModel();

  final routes = <String, WidgetBuilder>{
    //  DemoShopList.route: (BuildContext context) => DemoShopList()
  };

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  bool _flexibleUpdateAvailable = false;

// Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e) => _showError(e));
  }
  void _showError(dynamic exception) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(exception.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ShopViewModel>(
      model: shopViewModel,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bulk Buyers',
          routes: routes,
          theme: ThemeData(
              primaryColor: primarySwatch,
              canvasColor: Color.fromARGB(242, 243, 243, 243),
              backgroundColor: whiteSwatch,
              bottomAppBarTheme:
                  BottomAppBarTheme(elevation: 0, color: Colors.blue)),
          home: widget.isAthenicated ? NetworkSplashScreen() : WelcomeView()),
    );
  }
}
