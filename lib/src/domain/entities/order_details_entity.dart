import 'package:bulk_buyers/src/data/models/order_products_model.dart';
import 'package:equatable/equatable.dart';

class OrderDetailsEntity extends Equatable {
  final int orderdetailid;
  final int orderid;
  final int productid;
  final int quantity;
  final int unitprice;
  final double totalprice;
  final String productname;
  final String description;
  final OrderProducts product;
  final String created_at;

  OrderDetailsEntity(
      {this.orderdetailid,
      this.orderid,
      this.productid,
      this.quantity,
      this.unitprice,
      this.totalprice,
      this.productname,
      this.description,
      this.created_at,
      this.product})
      : super([
          orderdetailid,
          orderid,
          productid,
          quantity,
          unitprice,
          totalprice,
          productname,
          description,
          product,
          created_at
        ]);
}

class OrdersEnitiy extends Equatable {
  final int orderid;
  final int userid;
  final int orderstatid;
  final String orderrefno;
  final double totalcost;
  final int qty;
  final double discount;
  final bool ispaid;
  final String created_at;

  OrdersEnitiy(
      {this.orderid,
      this.userid,
      this.orderstatid,
      this.orderrefno,
      this.totalcost,
      this.qty,
      this.discount,
      this.ispaid,
      this.created_at})
      : super([
          orderid,
          userid,
          orderstatid,
          orderrefno,
          totalcost,
          qty,
          discount,
          ispaid,
          created_at,
        ]);
}
