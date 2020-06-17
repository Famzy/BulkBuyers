import 'dart:async';

import 'package:bulk_buyers/src/scoped_models/store/shop_view_model.dart';
import 'package:bulk_buyers/src/ui/shared/app_colors.dart';
import 'package:bulk_buyers/src/ui/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/ui/shared/ui_reducers.dart';
import 'package:bulk_buyers/src/ui/views/checkout/cart_view.dart';
import 'package:bulk_buyers/src/ui/views/checkout/wish_list_view.dart';
import 'package:bulk_buyers/src/ui/views/store/shop_view.dart';
import 'package:bulk_buyers/src/ui/views/user/profile_view.dart';
import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import '../base_view.dart';

class ProductDetailsView extends StatefulWidget {
  final int id;
  ProductDetailsView({this.id});
  @override
  _ProductDetailsViewState createState() => _ProductDetailsViewState(id: id);
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final int id;
  _ProductDetailsViewState({this.id});

  showCartSnak(String msg, bool flag) {
    print("ss $msg, $flag");
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            msg,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: (flag) ? primarySwatch : Colors.red[500],
          action: SnackBarAction(
              label: '',
              textColor: whiteSwatch,
              onPressed: () {
                print("test");
              }),
          duration: Duration(seconds: 2),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return BaseView<ShopViewModel>(
        onModelReady: (model) => model.getDetails(id),
        builder: (context, child, model) => Scaffold(
          key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back_ios)),
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
                            icon:
                                Image.asset('assets/images/home_selected.png'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: const Duration(milliseconds: 350),
                                      pageBuilder: (context, _, __) => ShopView()));
                            },
                          )),
                          Text(
                            'Home',
                            style: TextStyle(color: primarySwatch),
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
                          Text('Wish List',
                              style: TextStyle(color: Colors.blue))
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
                              pageBuilder: (context, _, __) => ProfileView()));
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
            body: ListView(
              children: <Widget>[
                Container(
                  height: screenHeight(context),
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 25.0),
                  decoration: BoxDecoration(
                      color: whiteSwatch,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0))),
                  child: Column(
                    children: <Widget>[
                      // Rectangle 2050

                      Container(
                        margin: EdgeInsets.only(top: 30.0),
                        width: screenWidth(context) / 1.1,
                        height: 610,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color(0x17000000),
                                  offset: Offset(0, 2),
                                  blurRadius: 52,
                                  spreadRadius: 0)
                            ],
                            color: const Color(0xffffffff)),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                   Expanded(
                                     flex: 5,
                                     child: CachedNetworkImage(
                                       imageUrl:
                                       "${Constants.IMAGE_BASE_URL}/${model.detailsProductImg}",
                                       placeholder: (context, url) =>
                                           Center(child: CircularProgressIndicator()),
                                       errorWidget: (context, url, error) =>
                                       const Icon(
                                         Icons.shopping_cart,
                                         color: primarySwatch,
                                       ),
                                     ),
                                   ),

                                 ],
                              ),
                            ),
                            UIHelper.verticalSpaceSmaller(),
                            Center(
                              child: Text("\u{20A6}${model.detailsPrice}",
                                  style: const TextStyle(
                                      color: const Color(0xffd83a00),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 21.0),
                                  textAlign: TextAlign.left),
                            ),
                            UIHelper.verticalSpaceSmaller(),
                            Center(
                              child: Text(model.detailsProductName,
                                  style: const TextStyle(
                                      color: const Color(0xffb7b7b7),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Roboto",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16.0),
                                  textAlign: TextAlign.left),
                            ),
                            UIHelper.verticalSpaceSmaller(),
                            Center(
                              child: Text(model.detailsDecription,
                                  style: const TextStyle(
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Helvetica",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 19.0),
                                  textAlign: TextAlign.center),
                            ),
                            UIHelper.verticalSpaceSmall(),
                            GestureDetector(
                              onTap: () async{
                                print(" details ${model.detaiilsProductId}");
                                model.addToCart(
                                    model.detaiilsProductId,
                                    model.detailsProductName,
                                    model.detailsPrice,
                                    model.detailsQuantity,
                                    model.detailsProductImg,
                                    model.detailsPrice,
                                    model.detailsDicount);
                                print("${model.cartMsg}, ${model.isSuccessful}");
                                Timer(Duration(milliseconds: 500), () {
                                  showCartSnak(model.cartMsg, model.isSuccessful);
                                });
                              },
                              child: Container(
                                width: 276,
                                height: 42,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(21)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0x29000000),
                                          offset: Offset(0, 3),
                                          blurRadius: 6,
                                          spreadRadius: 0)
                                    ],
                                    gradient: LinearGradient(
                                        begin: Alignment(0.07608816772699356,
                                            0.658575177192688),
                                        end: Alignment(0.8989955186843872,
                                            0.6693638563156128),
                                        colors: [
                                          const Color(0xffff9300),
                                          const Color(0xffd83a00)
                                        ])),
                                child: // ADD TO CART
                                    Center(
                                  child: Text("ADD TO CART",
                                      style: const TextStyle(
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Helvetica",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.0),
                                      textAlign: TextAlign.left),
                                ),
                              ),
                            ),
                            UIHelper.verticalSpaceSmaller(),
                            // Rectangle 1579
                            GestureDetector(
                              onTap: () =>  Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: const Duration(milliseconds: 350),
                                      pageBuilder: (context, _, __) => ShopView())),
                              child: Container(
                                width: 276,
                                height: 42,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(19)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0x29000000),
                                          offset: Offset(0, 3),
                                          blurRadius: 6,
                                          spreadRadius: 0)
                                    ],
                                    color: const Color(0xffffffff)),
                                child: Center(
                                  child: Text("BACK TO SHOP",
                                      style: const TextStyle(
                                          color: const Color(0xfffc5455),
                                          fontWeight: FontWeight.w700,
                                          fontFamily: "Helvetica",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.0),
                                      textAlign: TextAlign.left),
                                ),
                              ),
                            ),
                            UIHelper.verticalSpaceSmaller(),
                            Center(
                              child: // All orders get Free Delivery in Abuja
                                  Text("All orders get Free Delivery in Abuja",
                                      style: const TextStyle(
                                          color: const Color(0xff5d5d5d),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Roboto",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 15.0),
                                      textAlign: TextAlign.left),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }


  Widget _detailsView(ShopViewModel model) {
    return Container(
      child: Column(
        children: <Widget>[],
      ),
    );
  }
}
