import 'dart:async';

import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/core/utils/constants.dart';
import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/src/presentation/scoped_models/store/shop_view_model.dart';
import 'package:bulk_buyers/src/presentation/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/presentation/widgets/snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import '../base_view.dart';

class ProductDetailsView extends StatefulWidget {
  final int id;
  final String name;
  final int price;
  final int quantity;
  final String image;
  final int discount;
  ProductDetailsView(
      {this.id,
      this.name,
      this.price,
      this.quantity,
      this.image,
      this.discount});
  @override
  _ProductDetailsViewState createState() => _ProductDetailsViewState(id: id);
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final int id;
  _ProductDetailsViewState({this.id});
//
//  showCartSnak(String msg, bool flag) {
//    print("ss $msg, $flag");
//    _scaffoldKey.currentState.showSnackBar(SnackBar(
//      content: Text(
//        msg,
//        style: TextStyle(color: Colors.white),
//      ),
//      backgroundColor: (flag) ? primarySwatch : Colors.red[500],
//      action: SnackBarAction(
//          label: '',
//          textColor: whiteSwatch,
//          onPressed: () {
//            print("test");
//          }),
//      duration: Duration(seconds: 2),
//    ));
//  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ShopViewModel>(
      //  onModelReady: (model) => model.getDetails(id),
      builder: (context, child, model) => Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          iconTheme: IconThemeData(color: primarySwatch, size: 70),
          elevation: 0,
          backgroundColor: transparentSwatch,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: <Widget>[
              Container(
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
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 5,
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${Constants.IMAGE_BASE_URL}/${widget.image}",
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
                    ),
                    UIHelper.verticalSpaceSmaller(),
                    Center(
                      child: Text("\u{20A6}${widget.price}",
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
                      child: Text(widget.name,
                          style: const TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                              fontFamily: "Helvetica",
                              fontStyle: FontStyle.normal,
                              fontSize: 19.0),
                          textAlign: TextAlign.center),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    UIHelper.midButtonGradient(
                        onTap: () async {
                          await model.addToCart(
                              id: widget.id,
                              name: widget.name,
                              price: widget.price,
                              quantity: widget.quantity,
                              image: widget.image,
                              unitprice: widget.price,
                              discount: widget.discount);
                          model.show
                              ? showCartSnak(
                                  color: model.color,
                                  msg: model.msg,
                                  duration: 5,
                                  scaffoldKey: scaffoldKey)
                              : Container();
                        },
                        text: "ADD TO CART"),
                    SizedBox(
                      height: 10,
                    ),
                    UIHelper.midButton(
                        onTap: () => Router.navigator.pop(),
                        title: "BACK TO SHOP"),
                    UIHelper.verticalSpaceMedium(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

//                            UIHelper.verticalSpaceSmall(),
//                            GestureDetector(
//                              onTap: () async {
//                                print(" details ${model.detaiilsProductId}");
//                                model.addToCart(
//                                    model.detaiilsProductId,
//                                    model.detailsProductName,
//                                    model.detailsPrice,
//                                    model.detailsQuantity,
//                                    model.detailsProductImg,
//                                    model.detailsPrice,
//                                    model.detailsDicount);
//                                print(
//                                    "${model.cartMsg}, ${model.isSuccessful}");
//                                Timer(Duration(milliseconds: 500), () {
//                                  showCartSnak(
//                                      model.cartMsg, model.isSuccessful);
//                                });
//                              },

//                            ),
//                            UIHelper.verticalSpaceSmaller(),
//                            // Rectangle 1579
//                            GestureDetector(
//                              onTap: () => Navigator.push(
//                                  context,
//                                  PageRouteBuilder(
//                                      transitionDuration:
//                                          const Duration(milliseconds: 350),
//                                      pageBuilder: (context, _, __) =>
//                                          ShopView())),

//                            ),
//                            UIHelper.verticalSpaceSmaller(),
//                            Center(
//                              child: // All orders get Free Delivery in Abuja
//                                  Text("All orders get Free Delivery in Abuja",
//                                      style: const TextStyle(
//                                          color: const Color(0xff5d5d5d),
//                                          fontWeight: FontWeight.w400,
//                                          fontFamily: "Roboto",
//                                          fontStyle: FontStyle.normal,
//                                          fontSize: 15.0),
//                                      textAlign: TextAlign.left),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            )));
  }

//  Widget _detailsView(ShopViewModel model) {
//    return Container(
//      child: Column(
//        children: <Widget>[],
//      ),
//    );
//  }
}
