import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/src/presentation/widgets/navigation/bottom_nav_component.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class BottomNav {
  static Widget nav({@required int index}) {
    return Container(
      color: transparentSwatch,
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          index == 0
              ? selectedNav(
                  name: "Home",
                  onTap: index == 0
                      ? () => Router.navigator.pushNamed(Router.container)
                      : null,
                  icon: 'assets/images/home_selected.png')
              : unSelected(
                  name: "Home", onTap: null, icon: 'assets/images/home.png'),
          index == 1
              ? selectedNav(
                  name: "Cart",
                  onTap: () => {print("selected")},
                  icon: 'assets/images/cart_selected.png')
              : unSelected(
                  name: "Cart", onTap: null, icon: 'assets/images/cart.png'),
          index == 2
              ? selectedNav(
                  name: "Wish List",
                  onTap: index == 2
                      ? () => Router.navigator.pushNamed(Router.wishList)
                      : null,
                  icon: 'assets/images/wishlist_selected.png')
              : unSelected(
                  name: "Wish List",
                  onTap: null,
                  icon: 'assets/images/wishlist.png'),
          index == 3
              ? selectedNav(
                  name: "You",
                  onTap: index == 3
                      ? () => Router.navigator.pushNamed(Router.you)
                      : null,
                  icon: 'assets/images/you_selected.png')
              : unSelected(
                  name: "You", onTap: null, icon: 'assets/images/you.png'),
        ],
      ),
    );
  }
}

class Nav extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;

  const Nav({Key key, this.defaultSelectedIndex, this.onChange})
      : super(key: key);
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  String _currentPage = "Home";
  List<String> pageKeys = ["Home", "Cart", "Wish List", "You"];
  List<String> iconKeys = [
    'assets/images/home_selected.png',
    'assets/images/cart_selected.png',
    'assets/images/wishlist_selected.png',
    'assets/images/you_selected.png'
  ];
  List<String> unselectKeys = [
    'assets/images/home.png',
    'assets/images/cart.png',
    'assets/images/wishlist.png',
    'assets/images/you.png'
  ];
  @override
  void initState() {
    _selectedIndex = widget.defaultSelectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];
    for (var i = 0; i < pageKeys.length; i++) {
      _navBarItemList.add(buildNavBarItem(
          icon: iconKeys[i],
          index: i,
          unselect: unselectKeys[i],
          name: pageKeys[i]));
    }

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _navBarItemList,
      ),
    );
  }

  Widget buildNavBarItem(
      {String icon, int index, String name, String unselect}) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: index == _selectedIndex
          ? selectedNav(name: name, onTap: null, icon: icon)
          : unSelected(name: name, onTap: null, icon: unselect),
    );
  }
}
