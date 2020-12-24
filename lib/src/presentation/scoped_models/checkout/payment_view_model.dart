import 'dart:io';

import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/core/utils/paystack.dart';
import 'package:bulk_buyers/src/domain/repository/repository.dart';
import 'package:bulk_buyers/src/domain/usecase/orders_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:random_string/random_string.dart';
import 'package:meta/meta.dart';

import '../base_model.dart';

class PaymentViewModel extends BaseModel {
  final OrdersUC ordersUC;

  String reference;
  int total;
  int orderID;

  PaymentViewModel({OrdersUC orders})
      : assert(orders != null),
        ordersUC = orders;

  initCard(int id) {
    orderID = id;
    PaystackPlugin.initialize(publicKey: PAYSTACK_API_LIVE_KEY);
  }

  processPayment(
      {BuildContext context,
      int amount,
      String email,
      String cardNumber,
      String cvv,
      String expiryYear,
      String expiryMonth}) async {
    int cost = amount * 100;
    Charge charge = Charge();
    charge.card = _getCardFromUI(
        cardNumber: cardNumber,
        expiryMonth: expiryMonth,
        expiryYear: expiryYear,
        cvv: cvv);
    charge
      ..amount = cost
      ..reference = _getReference()
      ..email = email;
    CheckoutResponse response = await PaystackPlugin.checkout(context,
        method: CheckoutMethod.card, charge: charge);
    if (response.message == "Success") {
      Router.navigator.pushReplacementNamed(Router.paymentConfiramtion,
          arguments: PaymentConfiramtionArguments(
              ref: reference, orderid: orderID, totalcost: total));
    }
    print(response);
  }

  PaymentCard _getCardFromUI(
      {String cardNumber, String cvv, String expiryYear, String expiryMonth}) {
    return PaymentCard(
      number: cardNumber,
      cvc: cvv,
      expiryMonth: int.parse(expiryMonth),
      expiryYear: int.parse(expiryYear),
    );
  }

  String _getReference() {
    String platform;
    String ref;
    if (Platform.isIOS) {
      ref = randomAlphaNumeric(15);
      reference = ref;
      platform = 'iOS';
    } else {
      ref = randomAlphaNumeric(15);
      reference = ref;
      platform = 'Android';
    }
  }

  placeOrder({int id, int discount, String address}) {
    setState(ViewState.Busy);
    orderID = 0;
    print(address);
  }

  // Future<int> placeOrder(int discountid, int discount, String address) async {
  //   setState(ViewState.Busy);
  //   var sumation = await db.cartTotalPrice();
  //   var storeTotal = sumation - discount;
  //   _checkout = await db.getCartCheckoutItems();
  //   totalQty = await db.cartTotalQuantities();
  //   print("totalcost: $storeTotal, totalQTY: $totalQty, products: $_checkout");
  //   var order = await api.postOrders(PostOrders(
  //       totalcost: storeTotal,
  //       totalqty: totalQty,
  //       discountid: discountid,
  //       discount: discount,
  //       address: address,
  //       products: _checkout));
  //
  //   setState(ViewState.Success);
  //   //print(_checkout);
  //   print(order);
  //   return order;
  // }
}
