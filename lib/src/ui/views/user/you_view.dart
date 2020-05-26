
import 'package:bulk_buyers/src/data/repository.dart';
import 'package:bulk_buyers/src/scoped_models/user/you_view_model.dart';
import 'package:bulk_buyers/src/ui/shared/app_colors.dart';
import 'package:bulk_buyers/src/ui/shared/font_styles.dart';
import 'package:bulk_buyers/src/ui/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/ui/views/about_view.dart';
import 'package:bulk_buyers/src/ui/views/checkout/cart_view.dart';
import 'package:bulk_buyers/src/ui/views/checkout/orders_view.dart';
import 'package:bulk_buyers/src/ui/views/checkout/wish_list_view.dart';
import 'package:bulk_buyers/src/ui/views/how_it_works_view.dart';
import 'package:bulk_buyers/src/ui/views/store/shop_view.dart';
import 'package:bulk_buyers/src/ui/views/user/profile_view.dart';
import 'package:flutter/material.dart';


import 'package:flutter/widgets.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../base_view.dart';
import '../faq.dart';
import '../welcome_view.dart';

class YouView extends StatefulWidget {
  @override
  _YouViewState createState() => _YouViewState();
}

class _YouViewState extends State<YouView> {

  SharedPreferences sharedPreferences;

  var repo = Repository();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: GestureDetector(
            onTap: ()=>  Navigator.pop(context),
                      child: Image.asset(
              "assets/images/icon-ios-menu.png",
            ),
          ),
          actions: <Widget>[Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/icon.png"),
          )],
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
                          'assets/images/you_selected.png',
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
                      Text('You', style: TextStyle(color: primarySwatch))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(242, 243, 243, 243),
        body: Container(
          margin: EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
              color: whiteSwatch,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0))),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "You",
                      style: display3,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 350),
                            pageBuilder: (context, _, __) => OrdersView()));

                  },
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('assets/images/list.png'),
                        onPressed: () {

                        },
                      ),
                      Text("My Orders"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration:
                            const Duration(milliseconds: 350),
                            pageBuilder: (context, _, __) =>
                                WishListView()));
                  },
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('assets/images/like.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 350),
                                  pageBuilder: (context, _, __) =>
                                      WishListView()));
                        },
                      ),
                      Text("My WishList"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration:
                            const Duration(milliseconds: 350),
                            pageBuilder: (context, _, __) =>
                                ProfileView()));
                  },
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('assets/images/settings.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                  const Duration(milliseconds: 350),
                                  pageBuilder: (context, _, __) =>
                                      ProfileView()));
                        },
                      ),
                      Text("My Account"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration:
                            const Duration(milliseconds: 350),
                            pageBuilder: (context, _, __) =>
                                About()));
                  },
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('assets/images/about.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                  const Duration(milliseconds: 350),
                                  pageBuilder: (context, _, __) =>
                                      About()));
                        },
                      ),
                      Text("About Bulk Buyers Connect"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            transitionDuration:
                            const Duration(milliseconds: 350),
                            pageBuilder: (context, _, __) =>
                                FAQs()));
                  },
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('assets/images/how_it_works.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                  const Duration(milliseconds: 350),
                                  pageBuilder: (context, _, __) =>
                                      FAQs()));
                        },
                      ),
                      Text("FAQs"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: ()async {
                    print("click");
                    final RenderBox box = context.findRenderObject();
                    Share.share("Join me to buy your groceries in bulk from Bulk Buyers Connect. https://bit.ly/2LS9V9f",
                        subject: "Get Bulk Buyers Connect",
                        sharePositionOrigin:
                        box.localToGlobal(Offset.zero) &
                        box.size);
                  },
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('assets/images/refer.png'),
                        onPressed: () async {
                          print("click");
                          final RenderBox box = context.findRenderObject();
                          Share.share("Join me to buy your groceries in bulk from Bulk Buyers Connect. https://bit.ly/2LS9V9f",
                              subject: "Get Bulk Buyers Connect",
                              sharePositionOrigin:
                              box.localToGlobal(Offset.zero) &
                              box.size);
                        },
                      ),
                      Text("Refer-A-Friend"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async  {
                    repo.logout();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WelcomeView()));
                  },
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Image.asset('assets/images/logout.png'),
                        onPressed: () {

                        },
                      ),
                      Text("Logout of your account"),
                    ],
                  ),
                ),
                UIHelper.verticalSpace(height/9.9),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                       Text("Bulk Buyers Connect", style :
                        TextStyle(
                            color:  primarySwatch,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto",
                            fontStyle:  FontStyle.normal,
                            fontSize: 12.0
                        ),
                        textAlign: TextAlign.left
                    ),
                        UIHelper.verticalSpace(5),
                        Text("App Version 1.0", style: TextStyle(fontSize: 12, color:  const Color(0xff908888),
                          fontWeight: FontWeight.w400,),),
                        UIHelper.verticalSpace(5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }


}
