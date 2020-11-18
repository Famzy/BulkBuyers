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
                  onTap: index == 0 ? () => Router.navigator.pushNamed(Router.categories) : null,
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
                  onTap: index == 2 ? () => Router.navigator.pushNamed(Router.wishList ): null,
                  icon: 'assets/images/wishlist_selected.png')
              : unSelected(
                  name: "Wish List",
                  onTap: null,
                  icon: 'assets/images/wishlist.png'),
          index == 3
              ? selectedNav(
                  name: "You",
                  onTap: index == 3 ? () => Router.navigator.pushNamed(Router.you) : null,
                  icon: 'assets/images/you_selected.png')
              : unSelected(
                  name: "You", onTap: null, icon: 'assets/images/you.png'),
        ],
      ),
    );
  }
}
