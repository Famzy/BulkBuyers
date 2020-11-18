import 'package:bulk_buyers/core/enums/tab_items.dart';
import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context, {int materialIndex: 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[Router.categories](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex: 500}) {
    return {
//      Router.wishList: (context) => ColorsListPage(
//            color: activeTabColor[tabItem],
//            title: tabName[tabItem],
//            onPush: (materialIndex) =>
//                _push(context, materialIndex: materialIndex),
//          ),
//      Router.you: (context) => ColorDetailPage(
//            color: activeTabColor[tabItem],
//            title: tabName[tabItem],
//            materialIndex: materialIndex,
//          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: Router.categories,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
