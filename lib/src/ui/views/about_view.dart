import 'package:bulk_buyers/src/ui/shared/app_colors.dart';
import 'package:bulk_buyers/src/ui/shared/font_styles.dart';
import 'package:bulk_buyers/src/ui/shared/ui_helpers.dart';
import 'package:bulk_buyers/src/ui/views/store/shop_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'checkout/cart_view.dart';
import 'checkout/wish_list_view.dart';
import 'user/profile_view.dart';

class About extends StatelessWidget {
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
              children: <Widget>[
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "About Bulk Buyers Connect",
                      style: display3,
                    ),
                  ),
                ),
                UIHelper.verticalSpaceSmaller(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Center(
                    child: Text(
                      "Bulk Buyers Connect as the name implies is a platform for you and other individuals to come together to buy groceries and other items in Bulk by the aid of technology. \nBy logging in via the website or mobile phone app, you can make your orders and the platform will aggregate all orders every week and procure them from our previously sourced and accredited vendors for onward FREE delivery to you FRESH",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xff000000),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Center(
                    child: Text(
                      "Deliveries are done weekly on Fridays and Saturdays. All orders made on or before Wednesday of every week will be delivered on Friday/Saturday of the same week while any order after Wednesday will be delivered on Friday/Saturday of the following week.",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xff000000),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                UIHelper.verticalSpaceSmaller(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 10.0),
                  child: Text("How Are We Different?",
                      style: const TextStyle(
                          color: const Color(0xfffb6500),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Helvetica",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20.0, left: 20, top: 5),
                          child:  SvgPicture.asset('assets/svgs/checkmark_circle.svg'),
                        ),
                        Text(
                          "Make purchases at least 10-25% lower \nthan prevailing market prices.",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20.0, left: 20, top: 5),
                          child:  SvgPicture.asset('assets/svgs/checkmark_circle.svg'),
                        ),
                        Text(
                          "Get the best value for your money and \nmake tremendous savings on their regular \nmonthly household purchases.",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20.0, left: 20, top: 5),
                          child:  SvgPicture.asset('assets/svgs/checkmark_circle.svg'),
                        ),
                        Text(
                          "Get items at bulk purchase prices without\nhaving to buy bulk quantities.",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpaceSmall(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 10.0),
                  child: Text("What We Stand For",
                      style: const TextStyle(
                          color: const Color(0xfffb6500),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Helvetica",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                ),
                Divider(),
                UIHelper.verticalSpaceSmaller(),
                // Rectangle 2107
                Center(
                  child: Container(
                    width: 360,
                    height: 325,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: const Color(0xffb3e0fc)),
                    child: Column(
                      children: <Widget>[
                        UIHelper.verticalSpace(2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/images/quality.png',
                                scale: 1.5,
                              ),
                            ),
                            UIHelper.horizontalSpaceSmall(),
                            Text(
                              'Quality',
                              style: const TextStyle(
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 29.0),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/images/price.png',
                                scale: 1.5,
                              ),
                            ),
                            UIHelper.horizontalSpaceMedium(),
                            Text(
                              'Price',
                              style: const TextStyle(
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 29.0),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                'assets/images/speed.png',
                                scale: 1.5,
                              ),
                            ),
                            UIHelper.horizontalSpaceSmall(),
                            Text(
                              'Speed',
                              style: const TextStyle(
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 29.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpaceMedium(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 30.0),
                  child: Text("Feedback and Support",
                      style: const TextStyle(
                          color: const Color(0xfffb6500),
                          fontWeight: FontWeight.w500,
                          fontFamily: "Helvetica",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0),
                      textAlign: TextAlign.left),
                ),
                Divider(),
                // Call us: +234 809 975 5559
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                style: const TextStyle(
                                    color:  const Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 16.0
                                ),
                                text: "Call us: "),
                            TextSpan(
                                style: const TextStyle(
                                    color:  const Color(0xff000000),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Roboto",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 16.0
                                ),
                                text: "+234 809 975 5559")
                          ]
                      )
                  ),
                ),
                // Email us:  info@bulkbuyersconnect.com
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                style: const TextStyle(
                                    color:  const Color(0xff000000),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 16.0
                                ),
                                text: "Email us:  "),
                            TextSpan(
                                style: const TextStyle(
                                    color:  const Color(0xff000000),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Roboto",
                                    fontStyle:  FontStyle.normal,
                                    fontSize: 16.0
                                ),
                                text: " contact@bulkbuyersconnect.com")
                          ]
                      )
                  ),
                ),
                UIHelper.verticalSpaceLarge()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
