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

  OrderDetailsEntity(
      {this.orderdetailid,
      this.orderid,
      this.productid,
      this.quantity,
      this.unitprice,
      this.totalprice,
      this.productname,
      this.description,
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
        ]);
}
