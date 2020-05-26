
import 'package:bulk_buyers/src/scoped_models/store/shop_view_model.dart';
import 'package:bulk_buyers/src/ui/shared/app_colors.dart';
import 'package:bulk_buyers/src/ui/shared/font_styles.dart';
import 'package:bulk_buyers/src/ui/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/ui/views/store/shop_view.dart';
import 'package:bulk_buyers/src/ui/views/user/profile_view.dart';
import 'package:bulk_buyers/src/ui/views/user/you_view.dart';
import 'package:flutter/material.dart';

import 'base_view.dart';
import 'checkout/cart_view.dart';
import 'checkout/wish_list_view.dart';

class AuthenticatedView extends StatelessWidget {
  MediaQueryData queryData;
  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return  BaseView<ShopViewModel>(
      onModelReady: (model) => model.populateShop(),
        builder: (context, child, model) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 350),
                        pageBuilder: (context, _, __) => YouView())),
                child: Image.asset(
                  "assets/images/icon-ios-menu.png",
                ),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/icon.png"),
                )
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 350),
                              pageBuilder: (context, _, __) => ShopView()));
                    },
                    child: Container(
                      height: 58,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: IconButton(
                                icon: Image.asset('assets/images/home.png'),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          transitionDuration:
                                          const Duration(milliseconds: 350),
                                          pageBuilder: (context, _, __) => ShopView()));
                                },
                              )),
                          Text(
                            'Home',
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 350),
                              pageBuilder: (context, _, __) => CartView()));
                    },
                    child: Container(
                      height: 58,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: IconButton(
                                icon: Image.asset('assets/images/cart.png'),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          transitionDuration:
                                          const Duration(milliseconds: 350),
                                          pageBuilder: (context, _, __) => CartView()));
                                },
                              )),
                          Text(
                            'Cart',
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 350),
                              pageBuilder: (context, _, __) => WishListView()));
                    },
                    child: Container(
                      height: 58,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: IconButton(
                                icon: Image.asset('assets/images/wishlist.png'),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          transitionDuration:
                                          const Duration(milliseconds: 350),
                                          pageBuilder: (context, _, __) =>
                                              WishListView()));
                                },
                              )),
                          Text('Wish List', style: TextStyle(color: Colors.blue))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration:
                              const Duration(milliseconds: 350),
                              pageBuilder: (context, _, __) =>
                                  ProfileView()));
                    },
                    child: Container(
                      height: 58,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: IconButton(
                                icon: Image.asset(
                                  'assets/images/you.png',
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          transitionDuration:
                                          const Duration(milliseconds: 350),
                                          pageBuilder: (context, _, __) =>
                                              ProfileView()));
                                },
                              )),
                          Text('You', style: TextStyle(color: Colors.blue))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Color.fromARGB(242, 243, 243, 243),

        body: Container(
          margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                color: whiteSwatch,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0))),
            child: 
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        UIHelper.verticalSpaceLarge(),
                        Image.asset("assets/images/thumbs_up.png"),
                        UIHelper.verticalSpaceMedium(),
                        Text("HURRAY!", style: subHeading2,),
                        UIHelper.verticalSpaceMedium(),
                        Text("Welcome to Bulk Buyers \n Connect", style: subHeading3, textAlign: TextAlign.center,),
                        UIHelper.verticalSpaceMedium(),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: 300,
                            height: 40,
                            margin: EdgeInsets.only(bottom: 20),
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        transitionDuration:
                                        const Duration(milliseconds: 350),
                                        pageBuilder: (context, _, __) => ShopView()));
                              },
                              color: primarySwatch,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                              ),
                              textColor: Color.fromARGB(255, 0, 0, 0),
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "START SHOPPING !",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: "Roboto",
                                    color: whiteSwatch),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
            )));
  }

}