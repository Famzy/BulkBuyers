//import 'dart:convert';
//
//import 'package:bulk_buyers/src/models/order_details_model.dart';
//import 'package:bulk_buyers/src/models/order_products_model.dart';
//
//// OrderList orderListFromJson(String str) => OrderList.fromJson(json.decode(str));
//
//// String orderListToJson(OrderList data) => json.encode(data.toJson());
//
//OrderList orderListFromJson(String str) => OrderList.fromJson(json.decode(str));
//
//String orderListToJson(OrderList data) => json.encode(data.toJson());
//class OrderList {
//    List<UserOrder> orders;
//
//    OrderList({
//        this.orders,
//    });
//
//    factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
//        orders: List<UserOrder>.from(json["orders"].map((x) => UserOrder.fromJson(x))),
//    );
//
//    Map<String, dynamic> toJson() => {
//        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
//    };
//}
//
//class UserOrder {
//    int orderid;
//    int userid;
//    int orderstatid;
//    String orderrefno;
//    int totalcost;
//    int qty;
//    int discount;
//    bool ispaid;
//    String created_at;
//    DateTime updatedAt;
//    List<OrderDetails> orderdetails;
//
//    UserOrder({
//        this.orderid,
//        this.userid,
//        this.orderstatid,
//        this.orderrefno,
//        this.totalcost,
//        this.qty,
//        this.discount,
//        this.ispaid,
//        this.created_at,
//        this.updatedAt,
//        this.orderdetails,
//    });
//
//    factory UserOrder.fromJson(Map<String, dynamic> json) => UserOrder(
//        orderid: json["orderid"],
//        userid: json["userid"],
//        orderstatid: json["orderstatid"],
//        orderrefno: json["orderrefno"],
//        totalcost: json["totalcost"],
//        qty: json["qty"],
//        discount: json["discount"],
//        ispaid: json["ispaid"],
//        created_at: json["created_at"],
//        orderdetails: json["orderdetails"],
//        updatedAt: DateTime.parse(json["updated_at"]),
//    );
//
//    Map<String, dynamic> toJson() => {
//        "orderid": orderid,
//        "userid": userid,
//        "orderstatid": orderstatid,
//        "orderrefno": orderrefno,
//        "totalcost": totalcost,
//        "qty": qty,
//        "discount": discount,
//        "ispaid": ispaid,
//        "orderdetails": orderdetails,
//        "created_at": created_at,
//        "updated_at": updatedAt.toIso8601String(),
//    };
//}

// To parse this JSON data, do
//
//     final orderList = orderListFromJson(jsonString);

import 'dart:convert';

import 'order_details_model.dart';

OrderList orderListFromJson(String str) => OrderList.fromJson(json.decode(str));

String orderListToJson(OrderList data) => json.encode(data.toJson());

class OrderList {
    List<UserOrder> orders;

    OrderList({
        this.orders,
    });

    factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
        orders: List<UserOrder>.from(json["orders"].map((x) => UserOrder.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
    };
}

class UserOrder {
    int orderid;
    int userid;
    int orderstatid;
    String orderrefno;
    double totalcost;
    int qty;
    double discount;
    bool ispaid;
    String created_at;
    List <dynamic> orderdetails;

    UserOrder({
        this.orderid,
        this.userid,
        this.orderstatid,
        this.orderrefno,
        this.totalcost,
        this.qty,
        this.discount,
        this.ispaid,
        this.created_at,
        this.orderdetails,
    });

    factory UserOrder.fromJson(Map<String, dynamic> json) => UserOrder(
        orderid: json["orderid"],
        userid: json["userid"],
        orderstatid: json["orderstatid"],
        orderrefno: json["orderrefno"],
        totalcost: json["totalcost"],
        qty: json["qty"],
        discount: json["discount"],
        ispaid: json["ispaid"],
        created_at: json["created_at"],
       // orderdetails: List<OrderDetails>.from(json["orderdetails"].map((x) => OrderDetails.fromJson(x))),
        orderdetails: json['orderdetails'],
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
        //"orderdetails": List<dynamic>.from(orderdetails.map((x) => x.toJson())),
        "orderdetails" : orderdetails,
    };

    UserOrder.fromMap(
        Map<String, dynamic> map,
        ) {
        this.orderid = map['orderid'];
        this.userid = map['userid'];
        this.orderstatid = map['orderstatid'];
        this.orderrefno = map['orderrefno'];
        this.totalcost = map['totalcost'];
        this.qty = map['qty'];
        this.discount = map['discount'];
        this.ispaid = map['ispaid'] == 1;
        this.created_at = map['created_at'];
        this.orderdetails = map['orderdetails'];
    }
}




