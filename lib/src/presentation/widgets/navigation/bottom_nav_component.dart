import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/core/utils/theme/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

Widget selectedNav(
    {@required String name, @required Function onTap, @required String icon}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 66,
      width: 77,
      padding: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(11)),
          boxShadow: [
            BoxShadow(
                color: const Color(0x00000000),
                offset: Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 0)
          ],
          color: const Color(0xffffffff)),
      child: Column(
        children: <Widget>[
          Container(
            height: 3,
            width: 68,
            color: primarySwatch,
          ),
          Expanded(
              child: IconButton(
            icon: Image.asset(icon),
            onPressed: onTap,
          )),
          Text(
            name,
            style: navSelected,
          )
        ],
      ),
    ),
  );
}

Widget unSelected(
    {@required String name, @required Function onTap, @required String icon}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 66,
      padding: EdgeInsets.only(bottom: 15),
      child: Column(
        children: <Widget>[
          Expanded(
              child: IconButton(
            icon: Image.asset(icon),
            onPressed: onTap,
          )),
          Text(
            name,
            style: navText,
          )
        ],
      ),
    ),
  );
}
