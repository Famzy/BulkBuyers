import 'package:bulk_buyers/src/models/order_details_model.dart';
import 'package:bulk_buyers/src/scoped_models/checkout/order_details_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/checkout/orders_view_model.dart';
import 'package:bulk_buyers/src/ui/shared/app_colors.dart';
import 'package:bulk_buyers/src/ui/shared/font_styles.dart';
import 'package:bulk_buyers/src/ui/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/ui/views/checkout/cart_view.dart';
import 'package:bulk_buyers/src/ui/views/checkout/wish_list_view.dart';
import 'package:bulk_buyers/src/ui/views/store/shop_view.dart';
import 'package:bulk_buyers/src/ui/views/user/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';


class OrderDetailsView extends StatelessWidget {
  int id;
  String ref;
  int status;
  String date;
  double total;
  double discount;
  OrderDetailsView({this.id, this.ref, this.status, this.date, this.total, this.discount});
  @override
  Widget build(BuildContext context) {
    return BaseView<OrderDetailsViewModel>(
        onModelReady: (model) => model.fetchListData(id),
        builder: (context, childe, model) => Scaffold(
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
                                icon: Image.asset('assets/images/home.png'),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          transitionDuration:
                                          const Duration(milliseconds: 350),
                                          pageBuilder: (context, _, __) => ShopView()));
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
                              transitionDuration: const Duration(milliseconds: 350),
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
                                          pageBuilder: (context, _, __) => CartView()));
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
                              transitionDuration: const Duration(milliseconds: 350),
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
                          Text('Wish List', style: TextStyle(color: Colors.blue))
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              transitionDuration: const Duration(milliseconds: 350),
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
              children: <Widget>[
                Card(
                  elevation: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "REF: $ref ",
                          style: display3,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                             Image.asset(
                              'assets/images/calandar.png',
                              scale: 3,
                            ),
                            UIHelper.horizontalSpace(10),
                            Text("$date")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Color(0xfffdfbf7),),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Text("STATUS: ", style: TextStyle(
                            color:  const Color(0xff898989),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto",
                            fontStyle:  FontStyle.normal,
                            fontSize: 20.0
                        ),
                        ),
                        Text(
                          (() {
                            switch (status) {
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
                              switch (status) {
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
                            })(), fontWeight: FontWeight.w500,
                            fontFamily: "Roboto",
                            fontStyle:  FontStyle.normal,
                            fontSize: 20.0,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: blueGradient),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text("Product"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("QTY"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("Unit (\u{20A6})"),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text("Cost (\u{20A6})"),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                    child: _getBodyUi(context, model)),
                Expanded(flex:2,
                  child:  Column(
                    children: <Widget>[
                      Container(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: <Widget>[
                             Padding(
                               padding: const EdgeInsets.only(left: 40.0),
                               child: Text("Discount: ", style: TextStyle(
                                   color:  const Color(0xff989898),
                                   fontWeight: FontWeight.w400,
                                   fontFamily: "Roboto",
                                   fontStyle:  FontStyle.normal,
                                   fontSize: 19.0
                               ),),
                             ),

                             Text(" -\u{20A6}$discount", style: TextStyle(
                                 color:  const Color(0xffff0000),
                                 fontWeight: FontWeight.w500,
                                 fontFamily: "Roboto",
                                 fontStyle:  FontStyle.normal,
                                 fontSize: 18.0
                             ),
                                 textAlign: TextAlign.left
                             ),
                           ],
                         ),
                       ),
                      ),
                      Container(
                      decoration: BoxDecoration(color: blueGradient),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Text("Total Cost", style: TextStyle(
                                  color:  const Color(0xff989898),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                  fontStyle:  FontStyle.normal,
                                  fontSize: 25.0
                              ),),
                            ),

                            Text(" \u{20A6}$total", style: TextStyle(
                                color:  const Color(0xff000000),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Roboto",
                                fontStyle:  FontStyle.normal,
                                fontSize: 25.0
                            ),
                                textAlign: TextAlign.left
                            ),
                          ],
                        ),
                      ),
                ),
                    ],
                  ),)
              ],
            ))));
  }

   Widget _getBodyUi(BuildContext context, OrderDetailsViewModel model) {
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

   Widget _getListUi(OrderDetailsViewModel model) {
    return ListView.builder(
        itemCount: model.orderDetails.length,
        itemBuilder: (context, itemIndex) {
          var item = model.orderDetails[itemIndex];
          return _getListItemUi(item);
        });
  }

  Card _getListItemUi(OrderDetails result) {
    return Card(
      elevation: 2,
        margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(result.productname, textAlign: TextAlign.left,),
                  Text(result.description, textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Text("x${result.quantity.toString()}")),
            Expanded(flex: 1,
                child: Text("\u{20A6}${result.unitprice.toString()}",  style: TextStyle(fontWeight: FontWeight.w600))),
            Expanded(flex: 1,
                child: Text("\u{20A6}${result.totalprice.toString()}", style: TextStyle(fontWeight: FontWeight.w600))),
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
        Text('Fetching Your Order Details Please wait ...')
      ],
    ));
  }

  Widget _noDataUi(BuildContext context, OrderDetailsViewModel model) {
    return _getCenteredViewMessage(
      context, 
      "No data available yet",
      model);
  }

  Widget _errorUi(BuildContext context, OrderDetailsViewModel model) {
    return _getCenteredViewMessage(
        context, 
        "Error retrieving your data. Tap to try again",
        model,
        error: true);
  }

  Widget _getCenteredViewMessage(
      BuildContext context, String message, OrderDetailsViewModel model,
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
                    ? Icon( // WWrap in gesture detector and call you refresh future here
                        Icons.refresh,
                        color: primarySwatch,
                        size: 45.0,
                      )
                    : Container()
              ],
            )));
  }
}
