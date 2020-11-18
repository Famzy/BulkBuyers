import 'package:bulk_buyers/src/domain/entities/order_details_entity.dart';
import 'package:flutter/cupertino.dart';

import 'order_products_model.dart';

class OrderDetailsModel extends OrderDetailsEntity {
  OrderDetailsModel({
    @required orderdetailid,
    @required orderid,
    @required productid,
    @required quantity,
    @required unitprice,
    @required totalprice,
    @required productname,
    @required description,
    @required product,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        orderdetailid: json["orderdetailid"],
        orderid: json["orderid"],
        productid: json["productid"],
        quantity: json["quantity"],
        unitprice: json["unitprice"],
        totalprice: json["totalprice"],
        product: OrderProducts.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "orderdetailid": orderdetailid,
        "orderid": orderid,
        "productid": productid,
        "quantity": quantity,
        "unitprice": unitprice,
        "totalprice": totalprice,
        "product": product.toJson(),
        //  "orderdetails": List<dynamic>.from(orderdetails.map((x) => x.toJson())),
      };

  factory OrderDetailsModel.fromMap(
    Map<String, dynamic> map,
  ) =>
      OrderDetailsModel(
        orderdetailid: map["orderdetailid"],
        orderid: map["orderid"],
        productid: map["productid"],
        quantity: map["quantity"],
        unitprice: map["unitprice"],
        totalprice: map["totalprice"],
        product: OrderProducts.fromJson(map["product"]),
      );
}
