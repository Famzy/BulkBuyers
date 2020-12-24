//import 'dart:async';
//
//import 'package:bulk_buyers/core/router/routes.gr.dart';
//import 'package:bulk_buyers/core/utils/constants.dart';
//import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
//import 'package:bulk_buyers/core/utils/theme/font_styles.dart';
//import 'package:bulk_buyers/core/utils/theme/ui_reducers.dart';
//import 'package:bulk_buyers/src/data/models/products_view_model.dart';
//import 'package:bulk_buyers/src/presentation/scoped_models/store/shop_view_model.dart';
//import 'package:bulk_buyers/src/presentation/shared/ui_helpers.dart';
//import 'package:bulk_buyers/src/presentation/widgets/app_bar.dart';
//import 'package:bulk_buyers/src/presentation/widgets/navigation/buttom_nav.dart';
//import 'package:cached_network_image/cached_network_image.dart';
import 'package:bulk_buyers/core/utils/constants.dart';
import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/core/utils/theme/ui_reducers.dart';
import 'package:bulk_buyers/src/data/models/cart_model.dart';
import 'package:bulk_buyers/src/data/models/products_model.dart';
import 'package:bulk_buyers/src/presentation/scoped_models/store/shop_view_model.dart';
import 'package:bulk_buyers/src/presentation/widgets/app_bar.dart';
import 'package:bulk_buyers/src/presentation/widgets/card_helpers.dart';
import 'package:bulk_buyers/src/presentation/widgets/center_message.dart';
import 'package:bulk_buyers/src/presentation/widgets/snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';
//import 'package:scoped_model/scoped_model.dart';
//
//import '../base_view.dart';
//

class ShopView extends StatefulWidget {
  @override
  _ShopViewState createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<ShopViewModel>(
      onModelReady: (model) => model.getProducts(),
      builder: (context, child, model) => Scaffold(
        key: scaffoldKey,
        appBar: backAppBar(context: context),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: screenWidth(context),
                child: CardHelpers.productCard(name: "ALL PRODUCTS"),
              ),
            ),
            Expanded(
              flex: 13,
              child: _getBodyUi(context, model),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBodyUi(BuildContext context, ShopViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
        return getLoadingUi(context: context);
      case ViewState.NoDataAvailable:
        return noDataUi(context);
      case ViewState.Error:
        return errorUi(context);
      case ViewState.DataFetched:
      default:
        return _getListUi(model);
    }
  }

  Widget _getListUi(ShopViewModel model) {
    return ListView.builder(
        itemCount: model.products.length,
        itemBuilder: (context, itemIndex) {
          var item = model.products[itemIndex];
          return _getListItemUi(item, model);
        });
  }

//
  Widget _getListItemUi(ProductsModels result, ShopViewModel model) {
    return GestureDetector(
      onTap: () => model.viewProduct(id: result.productid),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(2.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                //  height: 120,
                width: 120,
                padding: EdgeInsets.all(5),
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CachedNetworkImage(
                      // imageUrl: 'http://3.8.238.181/buyers/public/3'
                      imageUrl:
                          "${Constants.IMAGE_BASE_URL}/${result.productimg}",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 4.0),
                      child: Text(result.productname,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 4),
                      child: Text(
                        "\u{20A6} ${result.price.toString()}",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black),
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
                    GestureDetector(
                      onTap: () {
                        print("${result.productid} ${!result.wishlist}");
                        // int id = result.productid;
                        // bool wishlist = result.wishlist;
                        // print("${result.productid} is Liked");
                        model.updateWishList(
                            id: result.productid, state: !result.wishlist);
                      },
                      child: Icon(
                        result.wishlist
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: primarySwatch,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: Container(),
                    ),
                    GestureDetector(
                      onTap: () async {
                        //  addToCart(item['price'], 1, item['productId'], 1, item['price'], item['price']);

                        await model.addToCart(
                            cartModel: CartModel(
                                productid: result.productid,
                                productname: result.productname,
                                totalprice: result.price,
                                quantity: result.quantity,
                                productimg: result.productimg,
                                unitprice: result.price,
                                discount: result.discount));
                        model.show
                            ? showCartSnak(
                                color: model.color,
                                msg: model.msg,
                                duration: 5,
                                scaffoldKey: scaffoldKey)
                            : Container();
                      },
                      child: Icon(
                        Icons.add_circle,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//class ShopView extends StatefulWidget {
//  @override
//  _ShopViewState createState() => _ShopViewState();
//}
//
//class _ShopViewState extends State<ShopView> {
//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//
//  TextEditingController searchCOntroller = TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//    return BaseView<ShopViewModel>(
////        onModelReady: (model) => model.fecthStoreProducts(),
//        builder: (context, child, model) => Scaffold(
//            key: _scaffoldKey,
//            appBar: backAppBar(context: context),
//            backgroundColor: Color.fromARGB(242, 243, 243, 243),
//            bottomNavigationBar: BottomNav.nav(index: 0),
//            body: GestureDetector(
//              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
//              child: Container(
//                margin: EdgeInsets.only(bottom: 10.0),
//                decoration: BoxDecoration(
//                    color: whiteSwatch,
//                    borderRadius: BorderRadius.only(
//                        bottomLeft: Radius.circular(20.0),
//                        bottomRight: Radius.circular(20.0))),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.stretch,
//                  children: <Widget>[
//                    UIHelper.verticalSpaceSmaller(),
//                    Container(
//                      height: 50,
//                      child: Row(
//                        children: <Widget>[
//                          Padding(
//                            padding: const EdgeInsets.symmetric(horizontal: 15),
//                            child: Icon(
//                              Icons.add_shopping_cart,
//                              color: primarySwatch,
//                            ),
//                          ),
//                          GestureDetector(
//                            onTap: () {
//                              showSearch(
//                                  context: context,
//                                  delegate: ProductSearch(model.items, model));
//                            },
//                            child: Container(
//                              height: 35,
//                              width: screenWidth(context) / 1.22,
//                              decoration: BoxDecoration(
//                                borderRadius:
//                                    BorderRadius.all(Radius.circular(4)),
//                                border: Border.all(color: graySwatch, width: 1),
//                              ),
//                              child: Row(
//                                mainAxisAlignment:
//                                    MainAxisAlignment.spaceBetween,
//                                crossAxisAlignment: CrossAxisAlignment.center,
//                                children: <Widget>[
//                                  Padding(
//                                    padding: const EdgeInsets.only(left: 8.0),
//                                    child: Text(
//                                      "search products",
//                                      style: TextStyle(color: graySwatch),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: const EdgeInsets.only(
//                                        left: 5, right: 10),
//                                    child: Icon(
//                                      Icons.search,
//                                      size: 20,
//                                      color: graySwatch,
//                                    ),
//                                  )
//                                ],
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                    UIHelper.verticalSpaceSmaller(),
//                    Container(
//                      width: double.infinity,
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Container(
//                            margin: EdgeInsets.only(left: 10.0),
//                            decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(2.0),
//                              color: const Color(0xfffc5455),
//                            ),
//                            child: Padding(
//                              padding: const EdgeInsets.all(3.0),
//                              child: Text(
//                                "ALL PRODUCTS",
//                                style: TextStyle(color: whiteSwatch),
//                              ),
//                            ),
//                          ),
//                          Container(
//                            margin: EdgeInsets.symmetric(horizontal: 10),
//                            child: Row(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Image.asset('assets/images/about.png'),
//                                Container(
//                                    padding: EdgeInsets.only(left: 10),
//                                    child: Text(
//                                      "Deliveries on Fridays \nand Saturdays",
//                                      style: TextStyle(color: primarySwatch),
//                                    ))
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                    UIHelper.verticalSpaceSmall(),
//                    Expanded(child: _getBodyUi(context, model)),
//                  ],
//                ),
//              ),
//            )));
//  }
//
//  Widget _getBodyUi(BuildContext context, ShopViewModel model) {
//    switch (model.state) {
//      case ViewState.Busy:
//        return _getLoadingUi(context);
//      case ViewState.NoDataAvailable:
//        return _noDataUi(context, model);
//      case ViewState.Error:
//        return _errorUi(context, model);
//      case ViewState.DataFetched:
//      default:
//        return _getListUi(model);
//    }
//  }
//
//  Widget _getListUi(ShopViewModel model) {
//    return ListView.builder(
//        itemCount: model.shopListing.length,
//        itemBuilder: (context, itemIndex) {
//          var item = model.shopListing[itemIndex];
//          return _getListItemUi(item);
//        });
//  }
//
//  Widget _getListItemUi(ProductsModels result) {
//    return GestureDetector(
//      onTap: () {
//        print(result.productid);
//        Router.navigator
//            .pushNamed(Router.productDetails, arguments: result.productid);
//      },
//      child: Card(
//        elevation: 2,
//        margin: EdgeInsets.all(2),
//        child: Row(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
//          mainAxisSize: MainAxisSize.max,
//          children: <Widget>[
//            Expanded(
//              flex: 2,
//              child: Container(
//                width: 150.0,
//                padding: EdgeInsets.all(5.0),
//                child: CachedNetworkImage(
//                  imageUrl: "${Constants.IMAGE_BASE_URL}/${result.productimg}",
//                  placeholder: (context, url) =>
//                      Center(child: CircularProgressIndicator()),
//                  errorWidget: (context, url, error) => const Icon(
//                    Icons.shopping_cart,
//                    color: primarySwatch,
//                  ),
//                ),
//              ),
//            ),
//            Expanded(
//              flex: 3,
//              child: Container(
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Padding(
//                      padding: EdgeInsets.only(left: 20.0, bottom: 4.0),
//                      child: Text(
//                        result.productname == null ? "" : result.productname,
//                        style: display3,
//                      ),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(left: 20.0, bottom: 4.0),
//                      child: Text(
//                        result.description,
//                        style: display5light,
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 20.0, top: 4.0),
//                      child: Text(
//                        result.price == null ? "" : "\u{20A6} ${result.price}",
//                        textAlign: TextAlign.left,
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//            Expanded(
//              flex: 1,
//              child: Container(
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    ScopedModelDescendant<ShopViewModel>(
//                        builder: (context, child, model) {
//                      return GestureDetector(
//                        onTap: () {
//                          setState(() {
//                            result.wishlist == 1;
//                          });
//                          model.updateWishlist(
//                              result.productid, result.wishlist);
//
//                          // model.updateWishlistHive(index);
//                        },
//                        child: Icon(
//                          result.wishlist
//                              ? Icons.favorite_border
//                              : Icons.favorite,
//                          color: primarySwatch,
//                        ),
//                      );
//                    }),
//                    UIHelper.verticalSpace(35),
//                    ScopedModelDescendant<ShopViewModel>(
//                        builder: (context, child, model) {
//                      return GestureDetector(
//                        onTap: () async {
//                          print(result.productname);
////
////                          model.addToCart(
////                              result.productid,
////                              result.productname,
////                              result.price,
////                              result.quantity,
////                              result.productimg,
////                              result.price,
////                              result.discount);
////                          Timer(Duration(milliseconds: 500), () {
////                            showCartSnak(model.cartMsg, model.isSuccessful);
////                          });
//                        },
//                        child: Icon(
//                          Icons.add_circle,
//                          color: Colors.green,
//                        ),
//                      );
//                    }),
//                  ],
//                ),
//              ),
//            ),
//          ],
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
//        UIHelper.verticalSpaceSmaller(),
//        Text('Updating Products')
//      ],
//    ));
//  }
//
//  Widget _noDataUi(BuildContext context, ShopViewModel model) {
//    return _getCenteredViewMessage(context, "No products available yet", model);
//  }
//
//  Widget _errorUi(BuildContext context, ShopViewModel model) {
//    return _getCenteredViewMessage(
//        context, "Error retrieving  products list. Tap to try again", model,
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
//                Column(
//                  children: <Widget>[
//                    Text(
//                      message,
//                      style: viewErrorTitle,
//                      textAlign: TextAlign.center,
//                    ),
//                    UIHelper.verticalSpaceSmall(),
//                    Text("Kindly refresh to see latest products"),
//                    UIHelper.verticalSpaceSmaller(),
//                    GestureDetector(
//                      onTap: () => model.reload(),
//                      child: Icon(
//                        // WWrap in gesture detector and call you refresh future here
//                        Icons.refresh,
//                        color: primarySwatch,
//                        size: 45.0,
//                      ),
//                    ),
//                  ],
//                ),
//                error
//                    ? Icon(
//                        // WWrap in gesture detector and call you refresh future here
//                        Icons.refresh,
//                        color: primaryColor,
//                        size: 45.0,
//                      )
//                    : Container()
//              ],
//            )));
//  }
//}
//
//class ProductSearch extends SearchDelegate<String> {
//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//  // final productsBox = Hive.box('store_products');
//  showCartSnak(String msg, bool flag) {
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
//
//  final List storeProducts;
//  ShopViewModel model;
//  ProductSearch(this.storeProducts, this.model);
//
//  @override
//  List<Widget> buildActions(BuildContext context) {
//    // Actions for search field
//    return [
//      IconButton(
//        icon: Icon(Icons.clear),
//        onPressed: () {
//          if (query.isEmpty) {
//            close(context, null);
//          }
//          query = "";
//        },
//      )
//    ];
//  }
//
//  @override
//  Widget buildLeading(BuildContext context) {
//    // leading icon on the left of the stuff
//    return IconButton(
//      icon: AnimatedIcon(
//        icon: AnimatedIcons.menu_arrow,
//        progress: transitionAnimation,
//      ),
//      onPressed: () {
//        close(context, null);
//      },
//    );
//  }
//
//  @override
//  Widget buildResults(BuildContext context) {
//    // TODO: implement buildResults based on selection
////    return Center(
////      child: Text(query),
////    );
//    final suggestionList = query.isEmpty
//        ? storeProducts
//        : storeProducts
//            .where((search) => search.startsWith(query.toLowerCase()))
//            .toList();
//    storeProducts.where((search) => search.startsWith(query)).toList();
//
//    return ListView.builder(
//      itemBuilder: (context, index) => ListTile(
//        leading: GestureDetector(
//          onTap: () async {
//            print(storeProducts.indexOf(suggestionList[index]));
//            int position = storeProducts.indexOf(suggestionList[index]);
//            var productID = await model.getProductFromSearch(position);
//            print(productID);
////            Navigator.push(
////                context,
////                PageRouteBuilder(
////                    transitionDuration: const Duration(milliseconds: 350),
////                    pageBuilder: (context, _, __) => ProductDetailsView(
////                          id: productID,
////                        )));
//            // close(context, null);
//          },
//          child: Icon(
//            Icons.search,
//            color: primarySwatch,
//          ),
//        ),
//        title: GestureDetector(
//          onTap: () async {
//            print(storeProducts.indexOf(suggestionList[index]));
//            int position = storeProducts.indexOf(suggestionList[index]);
//            var productID = await model.getProductFromSearch(position);
//            print(productID);
//            // close(context, null);
////            Navigator.push(
////                context,
////                PageRouteBuilder(
////                    transitionDuration: const Duration(milliseconds: 350),
////                    pageBuilder: (context, _, __) => ProductDetailsView(
////                          id: productID,
////                        )));
//          },
//          child: RichText(
//            text: TextSpan(
//                text: suggestionList[index].substring(0, query.length),
//                style: TextStyle(
//                    color: primarySwatch, fontWeight: FontWeight.bold),
//                children: [
//                  TextSpan(
//                      text: suggestionList[index].substring(query.length),
//                      style: TextStyle(color: Colors.grey))
//                ]),
//          ),
//        ),
//      ),
//      itemCount: suggestionList.length,
//    );
//  }
//
//  @override
//  Widget buildSuggestions(BuildContext context) {
//    // show when someone search
//    final suggestionList = query.isEmpty
//        ? storeProducts
//        : storeProducts
//            .where((search) => search.startsWith(query.toLowerCase()))
//            .toList();
//    //       : storeProducts.where((search) => search.startsWith(query)).toList();
//
//    return ListView.builder(
//      itemBuilder: (context, index) => ListTile(
//        leading: GestureDetector(
//          onTap: () async {
//            print(storeProducts.indexOf(suggestionList[index]));
//            int position = storeProducts.indexOf(suggestionList[index]);
//            var productID = await model.getProductFromSearch(position);
//            print(productID);
////            Navigator.push(
////                context,
////                PageRouteBuilder(
////                    transitionDuration: const Duration(milliseconds: 350),
////                    pageBuilder: (context, _, __) => ProductDetailsView(
////                          id: productID,
////                        )));
//            // close(context, null);
//          },
//          child: Icon(
//            Icons.search,
//            color: primarySwatch,
//          ),
//        ),
//        title: GestureDetector(
//          onTap: () async {
//            print(storeProducts.indexOf(suggestionList[index]));
//            int position = storeProducts.indexOf(suggestionList[index]);
//            // var productID = await model.getProductFromSearch(position);
//            // var productID = productsBox.get(position) as ShopHiveModle;
//            //  print("${productsBox.getAt(position)}");
//            // print(productID.toString());
//            // close(context, null);
//
////            Navigator.push(
////                context,
////                PageRouteBuilder(
////                    transitionDuration: const Duration(milliseconds: 350),
////                    pageBuilder: (context, _, __) => ProductDetailsView(
////                        //    id: productID.productid,
////                        id: 1)));
//          },
//          child: RichText(
//            text: TextSpan(
//                text: suggestionList[index].substring(0, query.length),
//                style: TextStyle(
//                    color: primarySwatch, fontWeight: FontWeight.bold),
//                children: [
//                  TextSpan(
//                      text: suggestionList[index].substring(query.length),
//                      style: TextStyle(color: Colors.grey))
//                ]),
//          ),
//        ),
//      ),
//      itemCount: suggestionList.length,
//    );
//  }
//}
