import 'package:bulk_buyers/src/models/products_model.dart';
import 'package:bulk_buyers/src/scoped_models/store/shop_view_model.dart';
import 'package:bulk_buyers/src/ui/shared/app_colors.dart';
import 'package:bulk_buyers/src/ui/shared/font_styles.dart';
import 'package:bulk_buyers/src/ui/views/store/shop_view.dart';
import 'package:bulk_buyers/src/ui/views/user/profile_view.dart';
import 'package:bulk_buyers/src/ui/views/user/you_view.dart';
import 'package:bulk_buyers/src/utils/constants.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:scoped_model/scoped_model.dart';

import '../base_view.dart';
import 'cart_view.dart';

class WishListView extends StatelessWidget {
  ShopViewModel shopViewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<ShopViewModel>(
        onModelReady: (model) => model.fetchWishList(),
        builder: (context, childe, model) => Scaffold(
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
                    onTap: () {},
                    child: Container(
                      height: 58,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: IconButton(
                            icon: Image.asset(
                                'assets/images/wishlist_selected.png'),
                            onPressed: () {},
                          )),
                          Text('Wish List',
                              style: TextStyle(color: primarySwatch))
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
            body: Container(
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
                          "Your Wish List",
                          style: display3,
                        ),
                      ),
                    ),
                    Expanded(child: _getBodyUi(context, model)),
                  ],
                ))));
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
        itemCount: model.wishListing.length,
        itemBuilder: (context, itemIndex) {
          var item = model.wishListing[itemIndex];
          return _getListItemUi(item);
        });
  }

  Widget _getListItemUi(StoreItems result) {
    return GestureDetector(
      onTap: () {},
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
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: 70,
                        child: CachedNetworkImage(
                          imageUrl:
                              "${Constants.IMAGE_BASE_URL}/${result.productimg}",
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
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
                        padding: const EdgeInsets.only(left: 20.0, bottom: 4.0),
                        child: Text(result.productname,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 4),
                        child: Text(
                          "\u{20A6}${result.price.toString()}",
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
                            model.addToCart(
                                result.productid,
                                result.productname,
                                result.price,
                                result.quantity,
                                result.productimg,
                                result.price,
                                result.discount);
                            model.updateWishlist(
                                result.productid, result.wishlist);
                          },
                          child: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.green,
                            size: 17,
                          ),
                        );
                      }),
                      ScopedModelDescendant<ShopViewModel>(
                          builder: (context, child, model) {
                        return GestureDetector(
                          onTap: () {
                            model.updateWishlist(
                                result.productid, result.wishlist);
                          },
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                            size: 17,
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
        Text('Fetching Wish List ...')
      ],
    ));
  }

  Widget _noDataUi(BuildContext context, ShopViewModel model) {
    return _getCenteredViewMessage(context, "Your Wish List is Empty", model);
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    height: 150,
                    child: Lottie.asset('assets/lottie/no_wishlist.json')),
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
