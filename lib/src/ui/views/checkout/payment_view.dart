import 'dart:io';

import 'package:bulk_buyers/src/scoped_models/store/shop_view_model.dart';
import 'package:bulk_buyers/src/ui/shared/app_colors.dart';
import 'package:bulk_buyers/src/ui/shared/font_styles.dart';
import 'package:bulk_buyers/src/ui/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/ui/views/base_view.dart';
import 'package:bulk_buyers/src/ui/views/checkout/paymet_confirmation.dart';
import 'package:bulk_buyers/src/ui/views/checkout/wish_list_view.dart';
import 'package:bulk_buyers/src/ui/views/store/shop_view.dart';
import 'package:bulk_buyers/src/ui/views/user/profile_view.dart';
import 'package:bulk_buyers/src/ui/widgets/busy_overlay.dart';
import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentView extends StatefulWidget {
  int total;
  int discount;
  int discountid;
  PaymentView({this.total, this.discountid, this.discount});
  @override
  _PaymentViewState createState() => _PaymentViewState(total: total, discount: discount, discountid: discountid);
}

class _PaymentViewState extends State<PaymentView> {
  final _formKey = new GlobalKey<FormState>();
  int total;
  int discount;
  int discountid;
  String validationMessage;
  int orderId;
  TextEditingController addressController = TextEditingController();
  bool get _hasEnteredInformation => addressController.text != '';
  _PaymentViewState({this.total, this.discountid, this.discount});

  var publicKey = Constants.PAYSTACK_API_LIVE_KEY;
  @override
  Widget build(BuildContext context) {
    return BaseView<ShopViewModel>(
      builder: (context,child, model ) => BusyOverlay(
        show: model.state == ViewState.Busy,
        child: Scaffold(
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
                    onTap: () {},
                    child: Container(
                      height: 58,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: IconButton(
                                icon: Image.asset('assets/images/cart_selected.png'),
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
                                  'assets/images/you.png',
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          transitionDuration:
                                          const Duration(milliseconds: 350),
                                          pageBuilder: (context, _, __) => ProfileView()));
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
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                        elevation: 2,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Checkout",
                            style: display3,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () => FocusScope.of(context)
                                    .requestFocus(FocusNode()),
                                child: Card(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "DELIVERY ADDRESS (ABUJA ONLY)",
                                          style: display4,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Text("we only deliver to Abuja for now"),
                                      UIHelper.verticalSpaceSmaller(),
                                      Container(
                                        height: 100,
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: whiteSwatch,
                                            border:
                                            Border.all(color: primarySwatch),
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right: 10.0, left: 10.0, top: 15.0),
                                          child:  Form(
                                            key: _formKey,
                                            child: TextFormField(
                                              maxLines: 6,
                                              controller: addressController,
                                              validator: (value) => value.isEmpty ? 'Kindly Enter your delivery address to proceed' : null,
                                              decoration: InputDecoration.collapsed(
                                                  hintText:
                                                  "Type your delivery address here"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      UIHelper.verticalSpaceSmaller(),
                                      Text(
                                        "Your Payment",
                                        style: TextStyle(
                                            color: graySwatch,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20),
                                      ),
                                      UIHelper.verticalSpaceSmaller(),
                                      Text(
                                        "\u{20A6}$total",
                                        style: TextStyle(
                                            color: primarySwatch,
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      UIHelper.verticalSpaceSmall(),

                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          width: 300,
                                          height: 40,
                                          margin: EdgeInsets.only(bottom: 20),
                                          child: RaisedButton(
                                            onPressed: () async{
                                              final form = _formKey.currentState;
                                              _formKey.currentState.save();
                                              if(form.validate()){
                                                await placeOrders(model);
                                                makePayments();
                                              }
                                              print("Address can't be empty");
                                            },
                                            color: blackSwatch,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(25)),
                                            ),
                                            textColor: Color.fromARGB(255, 0, 0, 0),
                                            padding: EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  "MAKE PAYMENT",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: "Roboto",
                                                      color: whiteSwatch),
                                                  textAlign: TextAlign.left,
                                                ),
                                                UIHelper.horizontalSpace(10),
                                                model.state == ViewState.Busy ?Container(
                                                  height: 20,
                                                  width: 20,
                                                  child: CircularProgressIndicator(
                                                    backgroundColor:primarySwatch,
                                                   valueColor:  new AlwaysStoppedAnimation<Color>(Colors.white),
                                                  ),
                                                ) : Container(height: 10, width: 10,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                          'assets/images/accepted_payments.png'),
                                      UIHelper.verticalSpaceLarge()
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    PaystackPlugin.initialize(publicKey: publicKey);
  }

  placeOrders(ShopViewModel model) async{
   orderId = await model.placeOrder(discountid, discount, addressController.text);
  }

  makePayments() async {

    print("discount id: $discountid discount: $discount");
    SharedPreferences prefs = await SharedPreferences.getInstance();
      String email = prefs.getString("email");
      int cost = total * 100;
      Charge charge = Charge()
        ..amount = cost
        ..reference = _getReference()
        ..email = email;
      CheckoutResponse response = await PaystackPlugin.checkout(context,
          method: CheckoutMethod.card, charge: charge);
      print(response);
      if (response.message == "Success") {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 350),
                pageBuilder: (context, _, __) =>
                    PaymentConfiramtion(
                      ref: response.reference,
                      orderid: orderId,
                      totalcost: cost,
                    )));
      }
    }
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = randomAlphaNumeric(25);
    } else {
      platform = platform = randomAlphaNumeric(25);
    }

    return platform;
  }

