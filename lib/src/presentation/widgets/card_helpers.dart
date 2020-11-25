import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/core/utils/theme/ui_reducers.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CardHelpers {
  static Widget promoCard(
      {@required BuildContext context,
      Function onTap,
      String image = 'promo'}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: screenWidth(context) / 2.5,
        height: screenHeight(context) / 6,
        decoration: BoxDecoration(
          //  boxShadow: Box,
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(19),
          ),
          image: DecorationImage(
            image: AssetImage(
              'assets/images/$image.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  static Widget productCard({String name = "ALL PRODUCTS"}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            color: const Color(0xfffc5455),
          ),
          child: Text(
            name,
            style: TextStyle(color: whiteSwatch),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Image.asset('assets/images/about.png'),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Deliveries on Fridays \nand Saturdays",
                  style: TextStyle(color: primarySwatch),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
