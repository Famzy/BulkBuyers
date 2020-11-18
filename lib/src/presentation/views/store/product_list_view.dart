//
import 'package:flutter/material.dart';

////import 'package:cached_network_image/cached_network_image.dart';
//import 'package:bulk_buyers/src/scoped_models/products_model.dart';
//import 'package:flutter/material.dart';
//
//import '../base_view.dart';
//
class ProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
//  int selectedIndex = 0;
//  @override
//  Widget build(BuildContext context) {
//    return BaseView<ProductViewModel>(
//      onModelReady: (model) => model.fetchListData(),
//      builder: (context, childe, model) => Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.black,
//          leading: Image.asset(
//            "assets/images/icon-ios-menu.png",
//          ),
//          actions: <Widget>[Image.asset("assets/images/icon.png")],
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
//                          ;
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
//                          pageBuilder: (context, _, __) => YouView()));
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
//                                  pageBuilder: (context, _, __) => YouView()));
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
//        body: Container(
//            margin: EdgeInsets.only(bottom: 10.0),
//            decoration: BoxDecoration(
//                color: whiteSwatch,
//                borderRadius: BorderRadius.only(
//                    bottomLeft: Radius.circular(20.0),
//                    bottomRight: Radius.circular(20.0))),
//            child: _getBodyUi(context, model)),
//      ),
//    );
//  }
//
//  Widget _getBodyUi(BuildContext context, ProductViewModel model) {
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
//  Widget _getListUi(ProductViewModel model) {
//    return ListView.builder(
//        itemCount: model.listData.length,
//        itemBuilder: (context, itemIndex) {
//          var item = model.listData[itemIndex];
//          //return _getListItemUi(item);
//        });
//  }
//
//  Widget _getListItemUi(Shop result) {
//    return GestureDetector(
//      onTap: () {},
//      child: Card(
//        elevation: 4,
//        margin: EdgeInsets.all(2.0),
//        child: Row(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.spaceAround,
//          mainAxisSize: MainAxisSize.max,
//          children: <Widget>[
//            Expanded(
//              flex: 2,
//              child: Container(
//                //  height: 120,
//                width: 120,
//                padding: EdgeInsets.all(5),
//                child: Column(
//                  //  mainAxisAlignment: MainAxisAlignment.end,
//                  children: <Widget>[
////                    CachedNetworkImage(
////                      // imageUrl: 'http://3.8.238.181/buyers/public/3'
////                      imageUrl:
////                          "${Constants.IMAGE_BASE_URL}/${result.productimg}",
////                      placeholder: (context, url) =>
////                          //CircularProgressIndicator(),
////                      errorWidget: (context, url, error) =>
////                          const Icon(Icons.error),
////                    ),
//                  ],
//                ),
//              ),
//            ),
//            Expanded(
//              flex: 3,
//              child: Container(
//                child: Column(
//                  // mainAxisAlignment: MainAxisAlignment.start,
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.only(left: 20.0, bottom: 4.0),
//                      child: Text(result.productname,
//                          style: TextStyle(
//                              fontWeight: FontWeight.bold,
//                              color: Colors.black)),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.only(left: 20.0, top: 4),
//                      child: Text(
//                        "\u{20A6} ${result.price.toString()}",
//                        textAlign: TextAlign.left,
//                        style: TextStyle(color: Colors.black),
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
//                    GestureDetector(
//                      onTap: () {
//                        int id = result.productid;
//                        bool wishlist = result.wishlist;
//                        print("${result.productid} is Liked");
//                      },
//                      child: Icon(
//                        Icons.favorite_border,
//                        color: primarySwatch,
//                      ),
//                    ),
//                    SizedBox(
//                      height: 35,
//                      child: Container(),
//                    ),
//                    GestureDetector(
//                      onTap: () async {
//                        //  addToCart(item['price'], 1, item['productId'], 1, item['price'], item['price']);
//
//                        print("${result.productname} is Added to cart");
//                      },
//                      child: Icon(
//                        Icons.add_circle,
//                        color: Colors.green,
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            )
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
//        Text('Fetching data ...')
//      ],
//    ));
//  }
//
//  Widget _noDataUi(BuildContext context, ProductViewModel model) {
//    return _getCenteredViewMessage(context, "No data available yet", model);
//  }
//
//  Widget _errorUi(BuildContext context, ProductViewModel model) {
//    return _getCenteredViewMessage(
//        context, "Error retrieving your data. Tap to try again", model,
//        error: true);
//  }
//
//  Widget _getCenteredViewMessage(
//      BuildContext context, String message, ProductViewModel model,
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
//}
}
