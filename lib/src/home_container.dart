import 'package:bulk_buyers/src/presentation/views/checkout/cart_view.dart';
import 'package:bulk_buyers/src/presentation/views/checkout/wish_list_view.dart';
import 'package:bulk_buyers/src/presentation/views/store/categories_view.dart';
import 'package:bulk_buyers/src/presentation/views/user/profile_view.dart';
import 'package:bulk_buyers/src/presentation/widgets/app_bar.dart';
import 'package:bulk_buyers/src/presentation/widgets/navigation/buttom_nav.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatefulWidget {
  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  PageController _pageController = PageController();
  int _selectedIndex = 0;
  List<Widget> _screen = [
    CategoriesView(),
    CartView(),
    WishListView(),
    ProfileView()
  ];

  void _onItemTaped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
    setState(() {
      _selectedIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context),
      bottomNavigationBar: Nav(
        defaultSelectedIndex: _selectedIndex,
        onChange: _onItemTaped,
      ),
      body: PageView(
        controller: _pageController,
        children: _screen,
        onPageChanged: (int index) {
          print("YO!! INDEX: $index");
          setState(() {
            _selectedIndex = index;
            print("$_selectedIndex");
          });
        },
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
