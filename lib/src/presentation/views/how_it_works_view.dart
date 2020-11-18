import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bulk_buyers/core/utils/faq_constants.dart';

import 'checkout/cart_view.dart';
import 'checkout/wish_list_view.dart';
import 'store/shop_view.dart';
import 'user/profile_view.dart';

class HowItWorks extends StatefulWidget {
  @override
  _HowItWorksState createState() => _HowItWorksState();
}

class _HowItWorksState extends State<HowItWorks> {
  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.black,
//        leading: GestureDetector(
//            onTap: () => Navigator.pop(context),
//            child: Icon(Icons.arrow_back_ios)),
//        actions: <Widget>[
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Image.asset("assets/images/icon.png"),
//          )
//        ],
//      ),
//      bottomNavigationBar: BottomAppBar(
//        color: Colors.transparent,
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            InkWell(
//              onTap: () {
//                Navigator.push(
//                    context,
//                    PageRouteBuilder(
//                        transitionDuration: const Duration(milliseconds: 350),
//                        pageBuilder: (context, _, __) => ShopView()));
//              },
//              child: Container(
//                height: 58,
//                child: Column(
//                  children: <Widget>[
//                    Expanded(
//                        child: IconButton(
//                      icon: Image.asset('assets/images/home.png'),
//                      onPressed: () {
//                        Navigator.push(
//                            context,
//                            PageRouteBuilder(
//                                transitionDuration:
//                                    const Duration(milliseconds: 350),
//                                pageBuilder: (context, _, __) => ShopView()));
//                      },
//                    )),
//                    Text(
//                      'Home',
//                      style: TextStyle(color: Colors.blue),
//                    )
//                  ],
//                ),
//              ),
//            ),
//            InkWell(
//              onTap: () {
//                Navigator.push(
//                    context,
//                    PageRouteBuilder(
//                        transitionDuration: const Duration(milliseconds: 350),
//                        pageBuilder: (context, _, __) => CartView()));
//              },
//              child: Container(
//                height: 58,
//                child: Column(
//                  children: <Widget>[
//                    Expanded(
//                        child: IconButton(
//                      icon: Image.asset('assets/images/cart.png'),
//                      onPressed: () {
//                        Navigator.push(
//                            context,
//                            PageRouteBuilder(
//                                transitionDuration:
//                                    const Duration(milliseconds: 350),
//                                pageBuilder: (context, _, __) => CartView()));
//                      },
//                    )),
//                    Text(
//                      'Cart',
//                      style: TextStyle(color: Colors.blue),
//                    )
//                  ],
//                ),
//              ),
//            ),
//            InkWell(
//              onTap: () {
//                Navigator.push(
//                    context,
//                    PageRouteBuilder(
//                        transitionDuration: const Duration(milliseconds: 350),
//                        pageBuilder: (context, _, __) => WishListView()));
//              },
//              child: Container(
//                height: 58,
//                child: Column(
//                  children: <Widget>[
//                    Expanded(
//                        child: IconButton(
//                      icon: Image.asset('assets/images/wishlist.png'),
//                      onPressed: () {
//                        Navigator.push(
//                            context,
//                            PageRouteBuilder(
//                                transitionDuration:
//                                    const Duration(milliseconds: 350),
//                                pageBuilder: (context, _, __) =>
//                                    WishListView()));
//                      },
//                    )),
//                    Text('Wish List', style: TextStyle(color: Colors.blue))
//                  ],
//                ),
//              ),
//            ),
//            InkWell(
//              onTap: () {
//                Navigator.push(
//                    context,
//                    PageRouteBuilder(
//                        transitionDuration: const Duration(milliseconds: 350),
//                        pageBuilder: (context, _, __) => ProfileView()));
//              },
//              child: Container(
//                height: 58,
//                child: Column(
//                  children: <Widget>[
//                    Expanded(
//                        child: IconButton(
//                      icon: Image.asset(
//                        'assets/images/you_selected.png',
//                      ),
//                      onPressed: () {
//                        Navigator.push(
//                            context,
//                            PageRouteBuilder(
//                                transitionDuration:
//                                    const Duration(milliseconds: 350),
//                                pageBuilder: (context, _, __) =>
//                                    ProfileView()));
//                      },
//                    )),
//                    Text('You', style: TextStyle(color: primarySwatch))
//                  ],
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//      backgroundColor: Color.fromARGB(242, 243, 243, 243),
//      body: Container(
//        margin: EdgeInsets.only(bottom: 10.0),
//        decoration: BoxDecoration(
//            color: whiteSwatch,
//            borderRadius: BorderRadius.only(
//                bottomLeft: Radius.circular(20.0),
//                bottomRight: Radius.circular(20.0))),
//        child: ListView(
//          children: <Widget>[
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Card(
//                  elevation: 2,
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Text(
//                      "How it works",
//                      style: display3,
//                    ),
//                  ),
//                ),
//                UIHelper.verticalSpaceSmaller(),
//                Padding(
//                  padding:
//                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                  child: Row(
//                    children: <Widget>[
//                      // Rectangle 2103
//                      Container(
//                          width: 4,
//                          height: 210,
//                          decoration:
//                              BoxDecoration(color: const Color(0xffff6400))),
//                      UIHelper.horizontalSpaceSmall(),
//                      Text(
//                        "Orders are made monthly by members \nstarting from the 3rd week of every \nmonth till the last week of the month \nwith every member putting money into a \npool fund via a  secure payment gateway \nusing their MasterCard or Visa card on \nthe app or online  portal for their selected\npurchases during this period. \nOrders/payments after the 29th day \nof every month will automatically only \napply to the next months cycle of \npurchases.",
//                        style: const TextStyle(
//                            color: const Color(0xff000000),
//                            fontWeight: FontWeight.w400,
//                            fontFamily: "Roboto",
//                            fontStyle: FontStyle.normal,
//                            fontSize: 16.0),
//                        textAlign: TextAlign.left,
//                      )
//                    ],
//                  ),
//                ),
//                UIHelper.verticalSpaceSmaller(),
//                Padding(
//                  padding:
//                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                  child: Row(
//                    children: <Widget>[
//                      // Rectangle 2103
//                      Container(
//                          width: 4,
//                          height: 60,
//                          decoration:
//                              BoxDecoration(color: const Color(0xffff6400))),
//                      UIHelper.horizontalSpaceSmall(),
//                      Text(
//                        "Note that each member would have \nchosen from a list of items what their \nfunds will be used \nto purchase.",
//                        style: const TextStyle(
//                            color: const Color(0xff000000),
//                            fontWeight: FontWeight.w400,
//                            fontFamily: "Roboto",
//                            fontStyle: FontStyle.normal,
//                            fontSize: 16.0),
//                        textAlign: TextAlign.left,
//                      )
//                    ],
//                  ),
//                ),
//                UIHelper.verticalSpaceSmaller(),
//                Padding(
//                  padding:
//                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                  child: Row(
//                    children: <Widget>[
//                      // Rectangle 2103
//                      Container(
//                          width: 4,
//                          height: 90,
//                          decoration:
//                              BoxDecoration(color: const Color(0xffff6400))),
//                      UIHelper.horizontalSpaceSmall(),
//                      Text(
//                        "All purchases are delivered from the last \nweek of the current month into the first \nweek of the new month, a notification \nwill be sent to each member to inform \nthem of their pickup location and time or \nthe delivery time of their product. ",
//                        style: const TextStyle(
//                            color: const Color(0xff000000),
//                            fontWeight: FontWeight.w400,
//                            fontFamily: "Roboto",
//                            fontStyle: FontStyle.normal,
//                            fontSize: 16.0),
//                        textAlign: TextAlign.left,
//                      )
//                    ],
//                  ),
//                ),
//                UIHelper.verticalSpaceLarge()
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
  }
}
