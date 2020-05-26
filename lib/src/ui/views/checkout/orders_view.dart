import 'package:bulk_buyers/src/models/orders_model.dart';
import 'package:bulk_buyers/src/scoped_models/checkout/orders_view_model.dart';
import 'package:bulk_buyers/src/ui/shared/app_colors.dart';
import 'package:bulk_buyers/src/ui/shared/font_styles.dart';
import 'package:bulk_buyers/src/ui/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/ui/views/checkout/order_details_view.dart';
import 'package:bulk_buyers/src/ui/views/checkout/wish_list_view.dart';
import 'package:bulk_buyers/src/ui/views/store/shop_view.dart';
import 'package:bulk_buyers/src/ui/views/user/profile_view.dart';
import 'package:bulk_buyers/src/ui/views/user/you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scoped_model/scoped_model.dart';

import '../base_view.dart';
import 'cart_view.dart';

class OrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<OrdersViewModel>(
        onModelReady: (model) => model.fetchListData(),
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
                              'assets/images/you_selected.png',
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Order History",
                              style: display3,
                            ),
                          ),
                          ScopedModelDescendant<OrdersViewModel>(
                              builder: (context, child, model) {
                            return GestureDetector(
                              onTap: () {
                                model.refreshOrders();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: primarySwatch,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      UIHelper.horizontalSpace(5),
                                      Icon(
                                        Icons.autorenew,
                                        color: whiteSwatch,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(6.0),
                                        child: Text(
                                          "Refresh List",
                                          style: TextStyle(color: whiteSwatch),
                                        ),
                                      ),
                                      UIHelper.horizontalSpace(5),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: blueGradient),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 4,
                              child: Text("OrderID"),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text("QTY"),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text("Price (\u{20A6})"),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: _getBodyUi(context, model)),
                  ],
                ))));
  }

  Widget _getBodyUi(BuildContext context, OrdersViewModel model) {
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

  Widget _getListUi(OrdersViewModel model) {
    return ListView.builder(
        itemCount: model.placedOrders.length,
        itemBuilder: (context, itemIndex) {
          var item = model.placedOrders[itemIndex];
          return _getListItemUi(item, context);
        });
  }

  Widget _getListItemUi(UserOrder result, BuildContext context) {
    return ScopedModelDescendant<OrdersViewModel>(
        builder: (context, child, model) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 350),
                  pageBuilder: (context, _, __) => OrderDetailsView(
                        id: result.orderid,
                        ref: result.orderrefno,
                        date: result.created_at,
                        status: result.orderstatid,
                        total: result.totalcost,
                        discount: result.discount,
                      )));
          print("from view: ${result.orderid}");
          // model.getOrderDetails(result.orderid);
        },
        child: Card(
          elevation: 3,
          margin:
              EdgeInsets.only(top: 10.0, bottom: 15.0, left: 10.0, right: 10.0),
          child: Container(
            padding: EdgeInsets.only(left: 10.0, right: 5.0),
            height: 80,
            child: Column(
              children: <Widget>[
                UIHelper.verticalSpaceSmaller(),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 4,
                        child: Text(
                          " ${result.orderrefno}",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        )),
                    Expanded(
                        flex: 1,
                        child: Text(
                          'x${result.qty}',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        )),
                    Expanded(
                        flex: 2,
                        child: Text(
                          '\u{20A6}${result.totalcost}',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        )),
                  ],
                ),
                UIHelper.verticalSpaceSmaller(),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/calandar.png',
                                scale: 3,
                              ),
                            ),
                            Text('${result.created_at}'),
                          ],
                        ),
                      ),
                      Text(
                        (() {
                          switch (result.orderstatid) {
                            case 1:
                              return "COMPLETED";
                            case 2:
                              return "PENDING";
                            case 3:
                              return "PROCESSING";
                            case 4:
                              return "IN PROGRESS";
                            default:
                              return "";

                              return "anything but true";
                          }
                        })(),
                        style: TextStyle(
                          color: (() {
                            switch (result.orderstatid) {
                              case 1:
                                return Colors.green;
                              case 2:
                                return blueSwatch;
                              case 3:
                                return Colors.orange;
                              case 4:
                                return Colors.pink;
                              default:
                                return "";

                                return "anything but true";
                            }
                          })(),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _getLoadingUi(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
        Text('Fetching Orders ...')
      ],
    ));
  }

  Widget _noDataUi(BuildContext context, OrdersViewModel model) {
    return _getCenteredViewMessage(context, "No Orders Yet", model);
  }

  Widget _errorUi(BuildContext context, OrdersViewModel model) {
    return _getCenteredViewMessage(
        context, "Error retrieving your data. Tap to try again", model,
        error: true);
  }

  Widget _getCenteredViewMessage(
      BuildContext context, String message, OrdersViewModel model,
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
                        color: Colors.white,
                        size: 45.0,
                      )
                    : Container()
              ],
            )));
  }
}
