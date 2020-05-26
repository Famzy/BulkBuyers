import 'package:bulk_buyers/src/ui/shared/app_colors.dart';
import 'package:bulk_buyers/src/ui/shared/font_styles.dart';
import 'package:bulk_buyers/src/ui/shared/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bulk_buyers/src/utils/faq_constants.dart';

import 'checkout/cart_view.dart';
import 'checkout/wish_list_view.dart';
import 'store/shop_view.dart';
import 'user/profile_view.dart';

class FAQs extends StatefulWidget {
  @override
  _FAQsState createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "FAQs",
                      style: display3,
                    ),
                  ),
                ),
                UIHelper.verticalSpaceSmaller(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Joining the Bulk Buyers Connect is a decision that marks the beginning of a long lasting relationship, we do not see you as just a client but as a partner",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Feel free to reach us: contact@bulkbuyersconnect.com, we will respond in a timely fashion.",
                      style: TextStyle(fontSize: 15)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Below is a list of questions we are frequently asked and some helpful answers.",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
                ),
                Divider(),
                ExpansionTile(
                  title: Text(
                    "Which Cities are covered By Bulk Buyers Connect?",
                    style: new TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: primarySwatch),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 8.0, right: 8.0, left: 15.0),
                      child: Center(
                        child: Text(
                            "As at now only residents of Abuja, Nigeria can benefit from the services of Bulk buyers Connect. Other cities in Nigeria are coming online soon.",
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ],
                ),
                Divider(),
                ExpansionTile(
                  title: Text(
                    "Is it safe to put my debit card details on this app?",
                    style: new TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: primarySwatch),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 8.0, right: 8.0, left: 15.0),
                      child: Center(
                        child: Text(
                            "Yes it is. We don’t store any of your debit card details, all payments are processed by our payment processor, ‘Paystack’, who are one of the best in the industry.",
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ],
                ),
                Divider(),
                ExpansionTile(
                  title: Text(
                    "What is your privacy policy?",
                    style: new TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: primarySwatch),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 8.0, right: 8.0, left: 15.0),
                      child: Center(
                        child: Text(
                            "We will never share your information with any third party, that means anyone other than you and us.",
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ],
                ),
                Divider(),
                ExpansionTile(
                  title: Text(
                    "Can I transfer money for my order to an account",
                    style: new TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: primarySwatch),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 8.0, right: 8.0, left: 15.0),
                      child: Center(
                        child: Text(
                            "The preferred mode of payment for all orders is by the secured payment gateway online via the website portal or app using a MasterCard or Visa Card.",
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ],
                ),
                Divider(),
                ExpansionTile(
                  title: Text(
                    "Is there a minimun order amount for members of the Bulk Buyers Connect? ",
                    style: new TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: primarySwatch),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 8.0, right: 8.0, left: 15.0),
                      child: Center(
                        child: Text(
                            "The minimum total value for orders per customer is N20,000.",
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ],
                ),
                Divider(),
                ExpansionTile(
                  title: Text(
                    "My order hasn't arrived",
                    style: new TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: primarySwatch),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, bottom: 8.0, right: 8.0, left: 15.0),
                      child: Center(
                        child: Text(
                            "Please check your order confirmation email for the order code and confirm timing of delivery, if that doesn’t solve it please send us an email: contact@bulkbuyersconnect.com and we will sort it out.",
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpaceMedium(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
