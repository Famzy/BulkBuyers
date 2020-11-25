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
    @required created_at,
  }) : super(
            orderid: orderid,
            orderdetailid: orderdetailid,
            productid: productid,
            quantity: quantity,
            unitprice: unitprice,
            totalprice: totalprice,
            productname: productname,
            description: description,
            created_at: created_at,
            product: product);

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        orderdetailid: json["orderdetailid"],
        orderid: json["orderid"],
        productid: json["productid"],
        quantity: json["quantity"],
        unitprice: json["unitprice"],
        totalprice: json["totalprice"],
        created_at: json['created_at'],
        product: OrderProducts.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "orderdetailid": orderdetailid,
        "orderid": orderid,
        "productid": productid,
        "quantity": quantity,
        "unitprice": unitprice,
        "totalprice": totalprice,
        'created_at': created_at,
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
        created_at: map['created_at'],
        product: OrderProducts.fromJson(map["product"]),
      );
}

class OrdersModel extends OrdersEnitiy {
  OrdersModel(
      {@required orderid,
      @required userid,
      @required orderstatid,
      @required orderrefno,
      @required totalcost,
      @required qty,
      @required discount,
      @required ispaid,
      @required created_at})
      : super(
            orderid: orderid,
            userid: userid,
            orderstatid: orderstatid,
            orderrefno: orderrefno,
            totalcost: totalcost,
            qty: qty,
            discount: discount,
            ispaid: ispaid,
            created_at: created_at);

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        orderid: json["orderid"],
        userid: json["userid"],
        orderstatid: json["orderstatid"],
        orderrefno: json["orderrefno"],
        totalcost: json["totalcost"],
        qty: json["qty"],
        discount: json["discount"],
        ispaid: json["ispaid"],
        created_at: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "orderid": orderid,
        "userid": userid,
        "orderstatid": orderstatid,
        "orderrefno": orderrefno,
        "totalcost": totalcost,
        "qty": qty,
        "discount": discount,
        "ispaid": ispaid,
        "created_at": created_at,
      };
}
