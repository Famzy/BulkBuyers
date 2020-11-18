import 'package:bulk_buyers/core/enums/tab_items.dart';
import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/src/presentation/views/checkout/cart_view.dart';
import 'package:bulk_buyers/src/presentation/views/checkout/wish_list_view.dart';
import 'package:bulk_buyers/src/presentation/views/store/categories_view.dart';
import 'package:bulk_buyers/src/presentation/views/user/you_view.dart';
import 'package:flutter/material.dart';

Map<TabItem, String> tabName = {
  TabItem.Home: 'Home',
  TabItem.Cart: 'Cart',
  TabItem.WishList: 'Wish List',
  TabItem.You: 'You',
};

Map<TabItem, Widget> activeTabColor = {
  TabItem.Home: CategoriesView(),
  TabItem.Cart: CartView(),
  TabItem.WishList: WishListView(),
  TabItem.You: YouView(),
};

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.Home),
        _buildItem(tabItem: TabItem.Cart),
        _buildItem(tabItem: TabItem.WishList),
        _buildItem(tabItem: TabItem.You),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    IconData icon = Icons.layers;
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? activeTabColor[item] : blueSwatch;
  }
}
