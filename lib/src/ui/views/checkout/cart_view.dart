import 'package:bulk_buyers/src/models/cart_items.dart';
import 'package:bulk_buyers/src/scoped_models/store/shop_view_model.dart';
import 'package:bulk_buyers/src/ui/shared/app_colors.dart';
import 'package:bulk_buyers/src/ui/shared/font_styles.dart';
import 'package:bulk_buyers/src/ui/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/ui/views/checkout/payment_view.dart';
import 'package:bulk_buyers/src/ui/views/checkout/wish_list_view.dart';
import 'package:bulk_buyers/src/ui/views/store/shop_view.dart';
import 'package:bulk_buyers/src/ui/views/user/profile_view.dart';
import 'package:bulk_buyers/src/ui/views/user/you_view.dart';
import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:scoped_model/scoped_model.dart';

import '../base_view.dart';

class CartView extends StatelessWidget {
  ShopViewModel shopViewModel;
  TextEditingController dicscountController = TextEditingController();
  int qty = 1;
  int subtotal = 0;
  int shippingFee = 500;
  bool hasData = true;


  @override
  Widget build(BuildContext context) {
    return BaseView<ShopViewModel>(
        onModelReady: (model) => model.fetchCartData(),
        builder: (context, childe, model) => Scaffold(
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
                    onTap: () {},
                    child: Container(
                      height: 58,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: IconButton(
                            icon:
                                Image.asset('assets/images/cart_selected.png'),
                            onPressed: () {},
                          )),
                          Text(
                            'Cart',
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
            body: GestureDetector(
              onTap: () => FocusScope.of(context)
                  .requestFocus(FocusNode()),
              child: Container(
                  margin: EdgeInsets.only(bottom: 10.0),
                  decoration: BoxDecoration(
                      color: whiteSwatch,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Your Cart",
                            style: display3,
                          ),
                        ),
                      ),
                      Expanded(flex: 2, child: _getBodyUi(context, model)),
                      UIHelper.verticalSpaceSmaller(),
                      Expanded(
                        flex: 2,
                        child: hasData
                            ? SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () => FocusScope.of(context)
                                          .requestFocus(FocusNode()),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              Column(
                                                children: <Widget>[
                                                  Text("Discount Code:"),
                                                  ScopedModelDescendant<
                                                          ShopViewModel>(
                                                      builder: (context, child,
                                                          model) {
                                                    return Text(
                                                      "${model.discountMsg}",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.red),
                                                    );
                                                  }),
                                                ],
                                              ),
                                              UIHelper.horizontalSpaceSmall(),
                                              // Rectangle 2081
                                              Container(
                                                width: 140,
                                                height: 40,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 10.0, left: 10.0),
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              bottom: -5,
                                                              left: 10),
                                                      hintText: "",
                                                      border:
                                                          OutlineInputBorder(),
                                                    ),
                                                    controller:
                                                        dicscountController,
                                                  ),
                                                ),
                                              ),
                                              UIHelper.horizontalSpaceSmall(),
                                            ],
                                          ),
                                          UIHelper.verticalSpaceSmaller(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: <Widget>[
                                              // Rectangle 2082
                                              ScopedModelDescendant<
                                                      ShopViewModel>(
                                                  builder:
                                                      (context, child, model) {
                                                return !model.isDiscounted
                                                    ? GestureDetector(
                                                        onTap: () {
                                                          model.getDiscount(
                                                              dicscountController
                                                                  .text);
                                                          print(
                                                              dicscountController
                                                                  .text);
                                                        },
                                                        child: Container(
                                                          width: 124,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                              Radius.circular(18),
                                                            ),
                                                            color: const Color(
                                                                0xffe96100),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "APPLY CODE",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "Roboto",
                                                                  color:
                                                                      whiteSwatch),
                                                              textAlign:
                                                                  TextAlign.left,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : GestureDetector(
                                                        onTap: () {
                                                          model.undoDiscount();
                                                          dicscountController.clear();
                                                        },
                                                        child: Container(
                                                          width: 124,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                              Radius.circular(18),
                                                            ),
                                                            color: blackSwatch,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              "REMOVE CODE",
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "Roboto",
                                                                  color:
                                                                      whiteSwatch),
                                                              textAlign:
                                                                  TextAlign.left,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                              }),
                                              UIHelper.horizontalSpaceSmall(),
                                            ],
                                          ),
                                          UIHelper.verticalSpace(5),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text("Subtotal"),
                                        ),
                                        ScopedModelDescendant<ShopViewModel>(
                                            builder: (context, child, model) {
                                          return Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 18.0),
                                              child: Text(
                                                "\u{20A6}${model.subtotal.toString()}",
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          );
                                        }),
                                      ],
                                    ),
                                    Divider(
                                      color: graySwatch,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8.0),
                                            child: Text("Discount Fee"),
                                          ),
                                        ),
                                        ScopedModelDescendant<ShopViewModel>(
                                            builder: (context, child, model) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 18.0),
                                            child: Text(
                                              "-${model.discount.hashCode}",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(color: Colors.red),
                                            ),
                                          );
                                        }),
                                      ],
                                    ),
                                    UIHelper.verticalSpaceSmaller(),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8.0),
                                            child: Text("Total"),
                                          ),
                                        ),
                                        ScopedModelDescendant<ShopViewModel>(
                                            builder: (context, child, model) {
                                          return Expanded(
                                            flex: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 18.0),
                                              child: Text(
                                                "\u{20A6}${model.total}",
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          );
                                        }),
                                      ],
                                    ),
                                    Divider(
                                      color: graySwatch,
                                    ),
                                    UIHelper.verticalSpaceSmaller(),
                                    ScopedModelDescendant<ShopViewModel>(
                                        builder: (context, child, model) {
                                      return Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          width: 300,
                                          height: 35,
                                          margin: EdgeInsets.only(bottom: 20),
                                          child: RaisedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                    transitionDuration:
                                                        const Duration(
                                                            milliseconds: 350),
                                                    pageBuilder:
                                                        (context, _, __) =>
                                                            PaymentView(
                                                      total: model.total,
                                                      discount:
                                                          model.discount.round(),
                                                      discountid: model.disID,
                                                    ),
                                                  ));
                                              print(model.total);
                                            },
                                            color: primarySwatch,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25)),
                                            ),
                                            textColor:
                                                Color.fromARGB(255, 0, 0, 0),
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "CHECKOUT NOW      | \u{20A6}${model.total.toString()}",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: "Roboto",
                                                  color: whiteSwatch),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: 300,
                                        height: 35,
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: RaisedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                    transitionDuration:
                                                        const Duration(
                                                            milliseconds: 350),
                                                    pageBuilder:
                                                        (context, _, __) =>
                                                            ShopView()));
                                          },
                                          color: whiteSwatch,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                          ),
                                          textColor: Color.fromARGB(255, 0, 0, 0),
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "CONTINUE SHOPING",
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
                                ),
                              )
                            : Container(),
                      )
                    ],
                  )),
            )));
  }

  Widget _getBodyUi(BuildContext context, ShopViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
        return _getLoadingUi(context);
      case ViewState.NoDataAvailable:
        return _noDataUi(context, model);
      case ViewState.Error:
        return _errorUi(context, model);
      case ViewState.DataFetched:
      default:
        return _getListUi(model);
    }
  }

  Widget _getListUi(ShopViewModel model) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: model.cartListing.length,
        itemBuilder: (context, itemIndex) {
          var item = model.cartListing[itemIndex];
          return _getListItemUi(item, itemIndex, context);
        });
  }

  Widget _getListItemUi(CartItems result, itemIndex, context)  {
    return GestureDetector(
      onTap: () {},
      child: GestureDetector(
          onTap: () => FocusScope.of(context)
              .requestFocus(FocusNode()),
        child: Card(
          elevation: 2,
          margin: EdgeInsets.all(2.0),
          child: Container(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 120,
                    padding: EdgeInsets.all(5),
                    child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ScopedModelDescendant<ShopViewModel>(
                            builder: (context, child, model) {
                          return GestureDetector(
                            onTap: () {
                              model.removeFromCart(result.cartid);
                            },
                            child: Center(
                              child: Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                                //   size: 23,
                              ),
                            ),
                          );
                        }),
                        UIHelper.horizontalSpace(8),
                        Container(
                          height: 70,
                          child: CachedNetworkImage(
                            imageUrl:
                                "${Constants.IMAGE_BASE_URL}/${result.productimg}",
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.add_shopping_cart, color: primarySwatch,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, bottom: 4.0),
                          child: Text(result.productname,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 4),
                          child: Text(
                            "\u{20A6}${result.totalprice.toString()}",
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ScopedModelDescendant<ShopViewModel>(
                            builder: (context, child, model) {
                          return GestureDetector(
                            onTap: () {
                              int quantity = result.quantity + 1;
                              int price = quantity * result.unitprice;
                              print(
                                  'this is q value: $quantity and p value $price');
                              model.updateCartPrice(
                                  result.productid, price, quantity);

                              print(
                                  'This is the ID to be passes: ${result.productid}');
                            },
                            child: Icon(
                              Icons.add_circle,
                              color: Colors.green,
                              // size: 20,
                            ),
                          );
                        }),
                        Container(
                          child: Text(result.quantity.toString()),
                        ),
                        ScopedModelDescendant<ShopViewModel>(
                            builder: (context, child, model) {
                          return GestureDetector(
                            onTap: () {
                              if (result.quantity > 1) {
                                int quantity = result.quantity - 1;
                                int price = quantity * result.unitprice;
                                print(
                                    'this is q value: $quantity and p value $price');
                                model.updateCartPrice(
                                    result.productid, price, quantity);
                              }
                            },
                            child: Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                              //  size: 20,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getLoadingUi(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
        Text('Fetching Cart Items ...')
      ],
    ));
  }

  Widget _noDataUi(BuildContext context, ShopViewModel model) {
    hasData = false;
    return _getCenteredViewMessage(context, "Your Cart is Empty", model);
  }

  Widget _errorUi(BuildContext context, ShopViewModel model) {
    return _getCenteredViewMessage(
        context, "Error retrieving your data. Tap to try again", model,
        error: true);
  }

  Widget _getCenteredViewMessage(
      BuildContext context, String message, ShopViewModel model,
      {bool error = false}) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    height: 150,
                    child: Lottie.asset('assets/lottie/cancel_order.json')),
                Text(
                  message,
                  style: viewErrorTitle,
                  textAlign: TextAlign.center,
                ),
                error
                    ? Icon(
                        // WWrap in gesture detector and call you refresh future here
                        Icons.refresh,
                        color: Colors.white,
                        size: 45.0,
                      )
                    : Container()
              ],
            )));
  }
}
