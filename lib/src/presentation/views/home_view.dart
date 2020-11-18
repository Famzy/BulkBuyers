import 'package:bulk_buyers/core/enums/tab_items.dart';
import 'package:bulk_buyers/core/router/routes.gr.dart';

import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/src/presentation/widgets/app_bar.dart';
import 'package:bulk_buyers/src/presentation/widgets/navigation/buttom_nav.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _currentPage = "Home";
  int _currentIndex;
  List<String> pageKeys = ["Home", "Cart", "Wish List", "You"];
  Map<String, GlobalKey<NavigatorState>> _navigtorKeys = {
    "Home": GlobalKey<NavigatorState>(),
    "Cart": GlobalKey<NavigatorState>(),
    "Wish List": GlobalKey<NavigatorState>(),
    "You": GlobalKey<NavigatorState>(),
  };

//  void _selectTab(TabItem tabItem) {
//    setState(() {
//      currentTab = tabItem;
//    });
//  }

  void _selectTab(String tabItem, int index) {
    setState(() {
      _currentPage = pageKeys[index];
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context),
//      bottomNavigationBar: BottomNavigation(
//        currentTab: currentTab,
//        onSelectTab: _selectTab,
//      ),
      bottomNavigationBar: BottomAppBar(
        color: transparentSwatch,
        child: BottomNav.nav(index: 0),
      ),
      body: _buildBody(),
    );
  }

  BottomNavigation(
      {TabItem currentTab, void Function(TabItem tabItem) onSelectTab}) {}

  Widget _buildBody() {
    return Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: FlatButton(
          child: Text(
            'PUSH',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
          onPressed: _push,
        ));
  }

  void _push() {
    Router.navigator.pushNamed(Router.categories);
//    Navigator.of(context).push(MaterialPageRoute(
//      // we'll look at ColorDetailPage later
////      builder: (context) => ColorDetailPage(
////        color: TabHelper.color(TabItem.red),
////        title: TabHelper.description(TabItem.red),
////      ),
//    ));
  }
}
