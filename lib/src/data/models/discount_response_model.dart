import 'package:bulk_buyers/src/domain/entities/discount_response_entity.dart';
import 'package:flutter/cupertino.dart';

class DiscountResponseModel extends DiscountResponseEntity {
  DiscountResponseModel({@required discountid, @required percent});

  factory DiscountResponseModel.fromJson(Map<String, dynamic> data) {
    return DiscountResponseModel(
        discountid: data['discountid'], percent: data['percent']);
  }

  Map<String, Object> toMap() {
    var map = new Map<String, Object>();

    map['discountid'] = discountid;
    map['percent'] = percent;

    return map;
  }
}
