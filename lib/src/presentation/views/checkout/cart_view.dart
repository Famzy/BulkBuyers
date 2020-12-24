import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/core/utils/constants.dart';
import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/src/data/models/cart_model.dart';
import 'package:bulk_buyers/src/presentation/scoped_models/store/shop_view_model.dart';
import 'package:bulk_buyers/src/presentation/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/presentation/widgets/card_helpers.dart';
import 'package:bulk_buyers/src/presentation/widgets/center_message.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:scoped_model/scoped_model.dart';

import '../base_view.dart';

class CartView extends StatelessWidget {
  // ShopViewModel shopViewModel;
  TextEditingController dicscountController = TextEditingController();
  int qty = 1;
  int subtotal = 0;
  int shippingFee = 500;

  @override
  Widget build(BuildContext context) {
    return BaseView<ShopViewModel>(
      onModelReady: (model) => model.fetchCart(),
      builder: (context, child, model) => Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CardHelpers.header(title: "Your Cart"),
              Expanded(flex: 2, child: _getBodyUi(context, model)),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: model.state == ViewState.DataFetched
                      ? SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () => FocusScope.of(context)
                                    .requestFocus(FocusNode()),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Text("Discount Code:"),
                                            Text(
                                              "${model.discountMsg}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                        UIHelper.horizontalSpaceSmall(),
                                        Container(
                                          width: 140,
                                          height: 40,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0, left: 10.0),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    bottom: -5, left: 10),
                                                hintText: "",
                                                border: OutlineInputBorder(),
                                              ),
                                              controller: dicscountController,
                                            ),
                                          ),
                                        ),
                                        UIHelper.horizontalSpaceSmall(),
                                      ],
                                    ),
                                    UIHelper.verticalSpaceSmaller(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        model.isDiscounted
                                            ? UIHelper.discount(
                                                color: blackSwatch,
                                                title: "REMOVE CODE",
                                                onTap: () {
                                                  dicscountController.clear();
                                                })
                                            : UIHelper.discount(
                                                color: primarySwatch,
                                                title: "APPLY CODE",
                                                onTap: null),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Subtotal"),
                                  Text(
                                    "\u{20A6}${model.subtotal.toString()}",
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Discount Fee"),
                                  Text("-${model.discount.hashCode}",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Total"),
                                  Text(
                                    "\u{20A6}${model.subtotal.toString()}",
                                    textAlign: TextAlign.right,
                                  )
                                ],
                              ),
                              Divider(),
                              SizedBox(
                                height: 10,
                              ),
                              UIHelper.gradient(
                                  onTap: () => model.checkout(),
                                  text: model.total.toString()),
                              SizedBox(
                                height: 10,
                              ),
                              UIHelper.shopBTN(text: "CONTINUE SHOPPING"),
                              UIHelper.verticalSpaceMedium(),
                            ],
                          ),
                        )
                      : Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getBodyUi(BuildContext context, ShopViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
        return getLoadingUi(context: context);
      case ViewState.NoDataAvailable:
        return noDataUi(
          context,
          text: "Your cart is Empty",
        );

      case ViewState.Error:
        return errorUi(context);
      case ViewState.DataFetched:
      default:
        return _getListUi(model);
    }
  }

  Widget _getListUi(ShopViewModel model) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: model.cart.length,
        itemBuilder: (context, itemIndex) {
          var item = model.cart[itemIndex];
          return _getListItemUi(item, itemIndex, context, model);
        });
  }

  Widget _getListItemUi(
      CartModel result, itemIndex, context, ShopViewModel model) {
    return dismiss(
      onSwipe: (direction) {
        if (direction == DismissDirection.endToStart) {
          model.removeFromCart(result.productid);
        } else if (direction == DismissDirection.startToEnd) {
          //  model.deleteItem(id: result.productid);
        }
      },
      key: "$result",
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Card(
          elevation: 2,
          margin: EdgeInsets.all(2.0),
          child: Container(
            height: 110,
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
                        GestureDetector(
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
                        ),
                        UIHelper.horizontalSpace(8),
                        Container(
                          height: 70,
                          child: CachedNetworkImage(
                            imageUrl:
                                "${Constants.IMAGE_BASE_URL}/${result.productimg}",
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.add_shopping_cart,
                              color: primarySwatch,
                            ),
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
                        GestureDetector(
                          onTap: () {
                            int quantity = result.quantity + 1;
                            int price = quantity * result.unitprice;

                            model.updateCartPrice(
                                id: result.productid,
                                price: price,
                                qty: quantity);
                          },
                          child: Icon(
                            Icons.add_circle,
                            color: Colors.green,
                             size: 30,
                          ),
                        ),
                        Container(
                          child: Text(result.quantity.toString()),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (result.quantity > 1) {
                              int quantity = result.quantity - 1;
                              int price = quantity * result.unitprice;
                              print(
                                  'this is q value: $quantity and p value $price');
                              model.updateCartPrice(
                                  id: result.productid,
                                  price: price,
                                  qty: quantity);
                            }
                          },
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                              size: 30,
                          ),
                        ),
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
}
