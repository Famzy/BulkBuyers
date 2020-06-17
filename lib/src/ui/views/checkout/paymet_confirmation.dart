import 'package:bulk_buyers/src/scoped_models/store/shop_view_model.dart';
import 'package:bulk_buyers/src/ui/shared/app_colors.dart';
import 'package:bulk_buyers/src/ui/shared/font_styles.dart';
import 'package:bulk_buyers/src/ui/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/ui/views/checkout/orders_view.dart';
import 'package:bulk_buyers/src/ui/views/checkout/wish_list_view.dart';
import 'package:bulk_buyers/src/ui/views/store/shop_view.dart';
import 'package:bulk_buyers/src/ui/views/user/you_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';
import 'cart_view.dart';

class PaymentConfiramtion extends StatelessWidget {
  String ref;
  int orderid;
  int totalcost;
  PaymentConfiramtion({this.ref, this.orderid, this.totalcost});
  MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return BaseView<ShopViewModel>(
        onModelReady: (model) => model.ordersPaidFor(ref, orderid, totalcost),
        builder: (context, child, model) => Scaffold(
              appBar: AppBar(
              backgroundColor: Colors.black,
              leading: GestureDetector(
                onTap: ()=> Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 350),
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
                                transitionDuration:
                                    const Duration(milliseconds: 350),
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
                                        pageBuilder: (context, _, __) =>
                                            ShopView()));
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
                                transitionDuration:
                                    const Duration(milliseconds: 350),
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
                                        pageBuilder: (context, _, __) =>
                                            CartView()));
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
                                transitionDuration:
                                    const Duration(milliseconds: 350),
                                pageBuilder: (context, _, __) =>
                                    WishListView()));
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
                            Text('Wish List',
                                style: TextStyle(color: Colors.blue))
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        
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
                              onPressed: () {},
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
                decoration: BoxDecoration(
                    color: whiteSwatch,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                child: Container(
                  //   width: queryData.size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Your Payment",
                            style: display3,
                          ),
                        ),
                      ),
                      Container(
                          child: Column(
                        children: <Widget>[
                          UIHelper.verticalSpaceLarge(),
                          Image.asset("assets/images/thumbs_up.png"),
                          UIHelper.verticalSpaceMedium(),
                          Text(
                            'Your order was placed \n successfully',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: primarySwatch,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          UIHelper.verticalSpaceSmaller(),
                          Text(
                            "Please Check your email for Details",
                            style: TextStyle(
                                color: graySwatch,
                                fontWeight: FontWeight.w500,
                                fontSize: 15.0),
                          ),
                          UIHelper.verticalSpaceLarge(),
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
                                          pageBuilder: (context, _, __) =>
                                              ShopView()));
                                },
                                color: primarySwatch,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                ),
                                textColor: Color.fromARGB(255, 0, 0, 0),
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "CONTINUE SHOPING",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Roboto",
                                      color: whiteSwatch),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              width: 300,
                              height: 40,
                              margin: EdgeInsets.only(bottom: 20),
                              child: RaisedButton(
                                onPressed: () async {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          transitionDuration:
                                              const Duration(milliseconds: 350),
                                          pageBuilder: (context, _, __) =>
                                              OrdersView()));
                                },
                                color: whiteSwatch,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                ),
                                textColor: Color.fromARGB(255, 0, 0, 0),
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "MY ORDERS",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: "Roboto",
                                      color: primarySwatch),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ));
  }
}
