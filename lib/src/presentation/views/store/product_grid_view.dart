import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

import '../base_view.dart';

class ProductGridView extends StatefulWidget {
  // ShopViewModel shopViewModel;

  @override
  _ProductGridViewState createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController searchCOntroller = TextEditingController();

//  showCartSnak(String msg, bool flag) {
//    _scaffoldKey.currentState.showSnackBar(SnackBar(
//      content: Text(
//        msg,
//        style: TextStyle(color: Colors.white),
//      ),
//      backgroundColor: (flag) ? primarySwatch : Colors.red[500],
//      action: SnackBarAction(
//          label: 'undo',
//          textColor: whiteSwatch,
//          onPressed: () {
//            print("test");
//          }),
//      duration: Duration(seconds: 2),
//    ));
//  }

  @override
  Widget build(BuildContext context) {
    //var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    //final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    //final double itemWidth = size.width / 2;

//    return BaseView<ShopViewModel>(
//      onModelReady: (model) => model.fecthStoreProducts(),
//      builder: (context, childe, model) => Scaffold(
//        key: _scaffoldKey,
//        appBar: AppBar(
//          backgroundColor: Colors.black,
//          leading: GestureDetector(
//            onTap: () => Navigator.push(
//                context,
//                PageRouteBuilder(
//                    transitionDuration: const Duration(milliseconds: 350),
//                    pageBuilder: (context, _, __) => YouView())),
//            child: Image.asset(
//              "assets/images/icon-ios-menu.png",
//            ),
//          ),
//          actions: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Image.asset("assets/images/icon.png"),
//            )
//          ],
//        ),
//        bottomNavigationBar: BottomAppBar(
//          color: Colors.transparent,
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              InkWell(
//                onTap: () {},
//                child: Container(
//                  height: 58,
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                          child: IconButton(
//                        icon: Image.asset('assets/images/home_selected.png'),
//                        onPressed: () {},
//                      )),
//                      Text(
//                        'Home',
//                        style: TextStyle(color: primarySwatch),
//                      )
//                    ],
//                  ),
//                ),
//              ),
//              InkWell(
//                onTap: () {
//                  Navigator.push(
//                      context,
//                      PageRouteBuilder(
//                          transitionDuration: const Duration(milliseconds: 350),
//                          pageBuilder: (context, _, __) => CartView()));
//                },
//                child: Container(
//                  height: 58,
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                          child: IconButton(
//                        icon: Image.asset('assets/images/cart.png'),
//                        onPressed: () {
//                          Navigator.push(
//                              context,
//                              PageRouteBuilder(
//                                  transitionDuration:
//                                      const Duration(milliseconds: 350),
//                                  pageBuilder: (context, _, __) => CartView()));
//                        },
//                      )),
//                      Text(
//                        'Cart',
//                        style: TextStyle(color: Colors.blue),
//                      )
//                    ],
//                  ),
//                ),
//              ),
//              InkWell(
//                onTap: () {
//                  Navigator.push(
//                      context,
//                      PageRouteBuilder(
//                          transitionDuration: const Duration(milliseconds: 350),
//                          pageBuilder: (context, _, __) => WishListView()));
//                },
//                child: Container(
//                  height: 58,
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                          child: IconButton(
//                        icon: Image.asset('assets/images/wishlist.png'),
//                        onPressed: () {
//                          Navigator.push(
//                              context,
//                              PageRouteBuilder(
//                                  transitionDuration:
//                                      const Duration(milliseconds: 350),
//                                  pageBuilder: (context, _, __) =>
//                                      WishListView()));
//                        },
//                      )),
//                      Text('Wish List', style: TextStyle(color: Colors.blue))
//                    ],
//                  ),
//                ),
//              ),
//              InkWell(
//                onTap: () {
//                  Navigator.push(
//                      context,
//                      PageRouteBuilder(
//                          transitionDuration: const Duration(milliseconds: 350),
//                          pageBuilder: (context, _, __) => ProfileView()));
//                },
//                child: Container(
//                  height: 58,
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                          child: IconButton(
//                        icon: Image.asset(
//                          'assets/images/you.png',
//                        ),
//                        onPressed: () {
//                          Navigator.push(
//                              context,
//                              PageRouteBuilder(
//                                  transitionDuration:
//                                      const Duration(milliseconds: 350),
//                                  pageBuilder: (context, _, __) =>
//                                      ProfileView()));
//                        },
//                      )),
//                      Text('You', style: TextStyle(color: Colors.blue))
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//        backgroundColor: Color.fromARGB(242, 243, 243, 243),
//        body: GestureDetector(
//            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
//            child: Container(
//              margin: EdgeInsets.only(bottom: 10.0),
//              decoration: BoxDecoration(
//                  color: whiteSwatch,
//                  borderRadius: BorderRadius.only(
//                      bottomLeft: Radius.circular(20.0),
//                      bottomRight: Radius.circular(20.0))),
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.stretch,
//                children: <Widget>[
//                  UIHelper.verticalSpaceSmaller(),
//                  Row(
//                    children: <Widget>[
//                      IconButton(
//                        onPressed: null,
//                        icon: Image.asset(
//                            'assets/images/material_cart_orange.png'),
//                      ),
//                      UIHelper.horizontalSpace(10),
//                      Expanded(
//                          child: Container(
//                        margin: EdgeInsets.only(right: 5.0),
//                        decoration: BoxDecoration(
//                          color: whiteSwatch,
//                          border: Border.all(color: ashSwatch),
//                          borderRadius: BorderRadius.circular(5),
//                        ),
//                        child: Padding(
//                          padding:
//                              const EdgeInsets.only(right: 10.0, left: 10.0),
//                          child: TextField(
//                            decoration: InputDecoration.collapsed(
//                                hintText: "Search products"),
//                            controller: searchCOntroller,
//                          ),
//                        ),
//                      ))
//                    ],
//                  ),
//                  UIHelper.verticalSpaceSmaller(),
//                  Row(
//                    children: <Widget>[
//                      Container(
//                        margin: EdgeInsets.only(left: 10.0),
//                        decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(2.0),
//                          color: Colors.redAccent,
//                        ),
//                        child: Padding(
//                          padding: const EdgeInsets.all(3.0),
//                          child: Text(
//                            "ALL PRODUCTS",
//                            style: TextStyle(color: whiteSwatch),
//                          ),
//                        ),
//                      ),
//                      UIHelper.horizontalSpace(90.0),
//                      GestureDetector(
//                        onTap: () {
//                          Navigator.push(
//                              context,
//                              PageRouteBuilder(
//                                  transitionDuration:
//                                      const Duration(milliseconds: 350),
//                                  pageBuilder: (context, _, __) => ShopView()));
//                        },
//                        child: Container(
//                          margin: EdgeInsets.only(left: 10.0),
//                          decoration: BoxDecoration(
//                            border: Border.all(color: ashSwatch),
//                            borderRadius: BorderRadius.circular(3.0),
//                            color: whiteSwatch,
//                          ),
//                          child: Padding(
//                            padding: const EdgeInsets.only(
//                                top: 3.0, bottom: 3.0, left: 15.0, right: 15.0),
//                            child: Text(
//                              "LIST",
//                              style: TextStyle(color: primarySwatch),
//                            ),
//                          ),
//                        ),
//                      ),
//                      GestureDetector(
//                        onTap: () {},
//                        child: Container(
//                          margin: EdgeInsets.only(left: 10.0),
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(3.0),
//                            color: ashSwatch,
//                          ),
//                          child: Padding(
//                            padding: const EdgeInsets.only(
//                                top: 3.0, bottom: 3.0, left: 15.0, right: 15.0),
//                            child: Text(
//                              "GRID",
//                              style: TextStyle(color: graySwatch),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                  UIHelper.verticalSpaceSmall(),
//                  Expanded(child: _getBodyUi(context, model)),
//                ],
//              ),
//            )),
//      ),
//    );
  }

//  Widget _getBodyUi(BuildContext context, ShopViewModel model) {
//    var size = MediaQuery.of(context).size;
//    // *24 is for notification bar on Android*/
//    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.2;
//    final double itemWidth = size.width / 2.3;
//
//    switch (model.state) {
//      case ViewState.Busy:
//        return _getLoadingUi(context);
//      case ViewState.NoDataAvailable:
//        return _noDataUi(context, model);
//      case ViewState.Error:
//        return _errorUi(context, model);
//      case ViewState.DataFetched:
//      default:
//        return _getGridUi(model, (itemWidth / itemHeight));
//    }
//  }
//
//  Widget _getGridUi(ShopViewModel model, asaspectRatio) {
//    return GridView.builder(
//      shrinkWrap: true,
//      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          crossAxisCount: 2, childAspectRatio: asaspectRatio),
//      itemCount: model.shopListing.length,
//      itemBuilder: (context, itemIndex) {
//        var item = model.shopListing[itemIndex];
//        return _getGridItemUi(item);
//      },
//    );
//  }
//
//  Widget _getGridItemUi(StoreItems result) {
//    return Padding(
//      padding: EdgeInsets.all(5.0),
//      child: Container(
//        child: Card(
//          color: Colors.white,
//          elevation: 0,
//          child: Container(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Container(
//                  child: Padding(
//                    padding: EdgeInsets.all(10),
//                    child: Row(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Expanded(
//                          child: CachedNetworkImage(
//                            imageUrl:
//                                "${DBConst.IMAGE_BASE_URL}/${result.productimg}",
//                            placeholder: (context, url) =>
//                                Center(child: CircularProgressIndicator()),
//                            errorWidget: (context, url, error) =>
//                                const Icon(Icons.error),
//                          ),
//                        ),
//                        ScopedModelDescendant<ShopViewModel>(
//                            builder: (context, child, model) {
//                          return Container(
//                              child: GestureDetector(
//                            onTap: () {
//                              model.updateWishlist(
//                                  result.productid, result.wishlist);
//                            },
//                            child: Icon(
//                              result.wishlist
//                                  ? Icons.favorite_border
//                                  : Icons.favorite,
//                              size: 20.0,
//                              color: primarySwatch,
//                            ),
//                          ));
//                        }),
//                      ],
//                    ),
//                  ),
//                ),
//                UIHelper.verticalSpace(3.0),
//                Padding(
//                  padding: EdgeInsets.only(left: 20),
//                  child: Text(
//                    result.productname,
//                    style: display5,
//                  ),
//                ),
//                UIHelper.verticalSpace(7.0),
//                Padding(
//                  padding: EdgeInsets.only(left: 20.0, bottom: 4.0),
//                  child: Text(
//                    result.description,
//                    style: display5light,
//                  ),
//                ),
//                UIHelper.verticalSpace(7.0),
//                Padding(
//                  padding: EdgeInsets.only(left: 20),
//                  child: Text(
//                    "\u{20A6}${result.price}",
//                    style: formTextsmall,
//                  ),
//                ),
//                UIHelper.verticalSpace(10),
//                ScopedModelDescendant<ShopViewModel>(
//                    builder: (context, child, model) {
//                  return GestureDetector(
//                    onTap: () {
//                      model.addToCart(
//                          result.productid,
//                          result.productname,
//                          result.price,
//                          result.quantity,
//                          result.productimg,
//                          result.price,
//                          result.discount);
//                      Timer(Duration(milliseconds: 500), () {
//                        showCartSnak(model.cartMsg, model.isSuccessful);
//                      });
//                    },
//                    child: Container(
//                      decoration: BoxDecoration(
//                          color: primarySwatch,
//                          borderRadius: BorderRadius.only(
//                              bottomRight: Radius.circular(3),
//                              bottomLeft: Radius.circular(3))),
//                      child: Row(
//                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        children: <Widget>[
//                          Expanded(
//                            flex: 3,
//                            child: Padding(
//                              padding: const EdgeInsets.only(left: 15.0),
//                              child: Text(
//                                "Add to Cart",
//                                style: TextStyle(color: whiteSwatch),
//                              ),
//                            ),
//                          ),
//                          Expanded(
//                            flex: 1,
//                            child: IconButton(
//                              onPressed: null,
//                              icon: Image.asset(
//                                'assets/images/material_cart_white.png',
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  );
//                }),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//
//  Widget _getLoadingUi(BuildContext context) {
//    return Center(
//        child: Column(
//      mainAxisSize: MainAxisSize.min,
//      children: <Widget>[
//        CircularProgressIndicator(
//            valueColor:
//                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
//        Text('Fetching data ...')
//      ],
//    ));
//  }
//
//  Widget _noDataUi(BuildContext context, ShopViewModel model) {
//    return _getCenteredViewMessage(context, "No data available yet", model);
//  }
//
//  Widget _errorUi(BuildContext context, ShopViewModel model) {
//    return _getCenteredViewMessage(
//        context, "Error retrieving your data. Tap to try again", model,
//        error: true);
//  }
//
//  Widget _getCenteredViewMessage(
//      BuildContext context, String message, ShopViewModel model,
//      {bool error = false}) {
//    return Center(
//        child: Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 20.0),
//            child: Column(
//              mainAxisSize: MainAxisSize.min,
//              children: <Widget>[
//                Text(
//                  message,
//                  style: viewErrorTitle,
//                  textAlign: TextAlign.center,
//                ),
//                error
//                    ? Icon(
//                        // WWrap in gesture detector and call you refresh future here
//                        Icons.refresh,
//                        color: Colors.white,
//                        size: 45.0,
//                      )
//                    : Container()
//              ],
//            )));
//  }
}
