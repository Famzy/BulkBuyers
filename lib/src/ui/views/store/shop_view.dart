import 'dart:async';

import 'package:bulk_buyers/src/models/products_model.dart';
import 'package:bulk_buyers/src/scoped_models/store/shop_view_model.dart';
import 'package:bulk_buyers/src/ui/shared/app_colors.dart';
import 'package:bulk_buyers/src/ui/shared/font_styles.dart';
import 'package:bulk_buyers/src/ui/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/ui/views/checkout/cart_view.dart';
import 'package:bulk_buyers/src/ui/views/checkout/wish_list_view.dart';
import 'package:bulk_buyers/src/ui/views/user/profile_view.dart';
import 'package:bulk_buyers/src/ui/views/user/you_view.dart';
import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../base_view.dart';

class ShopView extends StatefulWidget {
  @override
  _ShopViewState createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController searchCOntroller = TextEditingController();

  showCartSnak(String msg, bool flag) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
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
    double width = MediaQuery.of(context).size.width;
    return BaseView<ShopViewModel>(
        onModelReady: (model) => model.fecthStoreProducts(),
        builder: (context, childe, model) => Scaffold(
            key: _scaffoldKey,
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
                    onTap: () {},
                    child: Container(
                      height: 58,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: IconButton(
                            icon:
                                Image.asset('assets/images/home_selected.png'),
                            onPressed: () {},
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
            body: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
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
//
//                            },
//                            child: Container(
//                              height: 35,
//                              width: width / 1.22,
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
                    UIHelper.verticalSpaceSmaller(),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            color: const Color(0xfffc5455),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "ALL PRODUCTS",
                              style: TextStyle(color: whiteSwatch),
                            ),
                          ),
                        ),
                        UIHelper.horizontalSpace(90.0),
                      ],
                    ),
                    UIHelper.verticalSpaceSmall(),
                    Expanded(child: _getBodyUi(context, model)),
                  ],
                ),
              ),
            )));
    // body: Container(child: _getBodyUi(context, model))));
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
        itemCount: model.shopListing.length,
        itemBuilder: (context, itemIndex) {
          var item = model.shopListing[itemIndex];
          return _getListItemUi(item);
        });
  }

  Widget _getListItemUi(StoreItems result) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                width: 150.0,
                padding: EdgeInsets.all(5.0),
                child: CachedNetworkImage(
                  imageUrl: "${Constants.IMAGE_BASE_URL}/${result.productimg}",
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.shopping_cart,
                    color: primarySwatch,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 4.0),
                      child: Text(
                        result.productname,
                        style: display3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 4.0),
                      child: Text(
                        result.description,
                        style: display5light,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 4.0),
                      child: Text(
                        "\u{20A6} ${result.price}",
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
                          setState(() {
                            result.wishlist == 1;
                          });
                          model.updateWishlist(
                              result.productid, result.wishlist);
                        },
                        child: Icon(
                          result.wishlist
                              ? Icons.favorite_border
                              : Icons.favorite,
                          color: primarySwatch,
                        ),
                      );
                    }),
                    UIHelper.verticalSpace(35),
                    ScopedModelDescendant<ShopViewModel>(
                        builder: (context, child, model) {
                      return GestureDetector(
                        onTap: () async {
                          print(result.productname);
//
                          model.addToCart(
                              result.productid,
                              result.productname,
                              result.price,
                              result.quantity,
                              result.productimg,
                              result.price,
                              result.discount);
                          Timer(Duration(milliseconds: 500), () {
                            showCartSnak(model.cartMsg, model.isSuccessful);
                          });
                        },
                        child: Icon(
                          Icons.add_circle,
                          color: Colors.green,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
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
        UIHelper.verticalSpaceSmaller(),
        Text('Fetching Products')
      ],
    ));
  }

  Widget _noDataUi(BuildContext context, ShopViewModel model) {
    return _getCenteredViewMessage(context, "No products available yet", model);
  }

  Widget _errorUi(BuildContext context, ShopViewModel model) {
    return _getCenteredViewMessage(
        context, "Error retrieving  products list. Tap to try again", model,
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
                Text(
                  message,
                  style: viewErrorTitle,
                  textAlign: TextAlign.center,
                ),
                error
                    ? Icon(
                        // WWrap in gesture detector and call you refresh future here
                        Icons.refresh,
                        color: primaryColor,
                        size: 45.0,
                      )
                    : Container()
              ],
            )));
  }
}

class ProductSearch extends SearchDelegate<String> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  showCartSnak(String msg, bool flag) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
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

  final List storeProducts;
  ShopViewModel model;
  ProductSearch(this.storeProducts, this.model);

  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for search field
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          }
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the stuff
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults based on selection
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone search
    final suggestionList = query.isEmpty
        ? storeProducts
        : storeProducts.where((search) => search.startsWith(query.toLowerCase())).toList();
    //       : storeProducts.where((search) => search.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: GestureDetector(
          onTap: () {
            print(storeProducts.indexOf(suggestionList[index]));
            int position = storeProducts.indexOf(suggestionList[index]);
            model.getProductFromSearch(position);
            Timer(Duration(milliseconds: 500), () {
              showCartSnak(model.cartMsg, model.isSuccessful);
            });
            close(context, null);
          },
          child: Icon(
            Icons.add_shopping_cart,
            color: primarySwatch,
          ),
        ),
        title: GestureDetector(
          onTap: () {
            print(storeProducts.indexOf(suggestionList[index]));
            int position = storeProducts.indexOf(suggestionList[index]);
            model.getProductFromSearch(position);
            Timer(Duration(milliseconds: 500), () {

              showCartSnak(model.cartMsg, model.isSuccessful);
            });
            close(context, null);
          },
          child: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                    color: primarySwatch, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ]),
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
