import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

Container appBody({@required Widget child}) {
  return Container(
      decoration: BoxDecoration(
          color: whiteSwatch,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0))),
      margin: EdgeInsets.only(bottom: 5.0),
      child: child);
}
