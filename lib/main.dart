import 'dart:io';

import 'package:bulk_buyers/src/scoped_models/store/shop_view_model.dart';
import 'package:bulk_buyers/src/ui/shared/app_colors.dart';
import 'package:bulk_buyers/src/ui/views/store/shop_view.dart';
import 'package:bulk_buyers/src/ui/views/welcome_view.dart';
import 'package:bulk_buyers/src/utils/page_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
class MyApp extends StatelessWidget {
  MyApp({this.isAthenicated});
  ShopViewModel shopViewModel = ShopViewModel();
  static AsyncMemoizer apiMemo = new AsyncMemoizer();
  bool isAthenicated;

  final routes = <String, WidgetBuilder>{
    //  DemoShopList.route: (BuildContext context) => DemoShopList()
  };
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
          home: isAthenicated ? ShopView() : WelcomeView()),
    );
  }
}
