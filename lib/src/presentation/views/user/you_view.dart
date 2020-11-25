import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/core/utils/theme/font_styles.dart';
import 'package:bulk_buyers/core/utils/theme/ui_reducers.dart';
import 'package:bulk_buyers/src/presentation/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/presentation/widgets/app_bar.dart';
import 'package:bulk_buyers/src/presentation/widgets/navigation/buttom_nav.dart';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:share/share.dart';

class YouView extends StatefulWidget {
  @override
  _YouViewState createState() => _YouViewState();
}

class _YouViewState extends State<YouView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context: context),
      backgroundColor: Color.fromARGB(242, 243, 243, 243),
      bottomNavigationBar: BottomNav.nav(index: 3),
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
                onTap: () => Router.navigator.pushNamed(Router.orders),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('assets/images/list.png'),
                      onPressed: () =>
                          Router.navigator.pushNamed(Router.orders),
                    ),
                    Text("My Orders"),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Router.navigator.pushNamed(Router.wishList),
                child: Row(
                  children: <Widget>[
                    IconButton(
                        icon: Image.asset('assets/images/like.png'),
                        onPressed: () =>
                            Router.navigator.pushNamed(Router.wishList)),
                    Text("My WishList"),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Router.navigator.pushNamed(Router.profile),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('assets/images/settings.png'),
                      onPressed: () =>
                          Router.navigator.pushNamed(Router.profile),
                    ),
                    Text("My Account"),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Router.navigator.pushNamed(Router.about),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('assets/images/about.png'),
                      onPressed: () => Router.navigator.pushNamed(Router.about),
                    ),
                    Text("About Bulk Buyers Connect"),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Router.navigator.pushNamed(Router.faQs),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('assets/images/how_it_works.png'),
                      onPressed: () => Router.navigator.pushNamed(Router.faQs),
                    ),
                    Text("FAQs"),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  print("click");
                  final RenderBox box = context.findRenderObject();
                  Share.share(
                      "Join me to buy your groceries in bulk from Bulk Buyers Connect. https://play.google.com/store/apps/details?id=com.bulkbuyersconnect.bulk_buyers",
                      subject: "Get Bulk Buyers Connect",
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size);
                },
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('assets/images/refer.png'),
                      onPressed: () async {
                        print("click");
                        final RenderBox box = context.findRenderObject();
                        Share.share(
                            "Join me to buy your groceries in bulk from Bulk Buyers Connect. https://play.google.com/store/apps/details?id=com.bulkbuyersconnect.bulk_buyers",
                            subject: "Get Bulk Buyers Connect",
                            sharePositionOrigin:
                                box.localToGlobal(Offset.zero) & box.size);
                      },
                    ),
                    Text("Refer-A-Friend"),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Router.navigator
                      .pushNamedAndRemoveUntil(Router.loginView, (r) => false);
                },
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Image.asset('assets/images/logout.png'),
                      onPressed: () => Router.navigator.pushNamedAndRemoveUntil(
                          Router.loginView, (r) => false),
                    ),
                    Text("Logout of your account"),
                  ],
                ),
              ),
              UIHelper.verticalSpace(screenHeight(context) / 9.9),
              Container(
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Bulk Buyers Connect",
                          style: TextStyle(
                              color: primarySwatch,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
                          textAlign: TextAlign.left),
                      UIHelper.verticalSpace(5),
                      Text(
                        "App Version 1.1",
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color(0xff908888),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
