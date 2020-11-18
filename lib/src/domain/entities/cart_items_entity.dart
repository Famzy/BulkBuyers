import 'package:equatable/equatable.dart';

class CartItemsEntity extends Equatable {
  final int cartid;
  final int productid;
  final String productname;
  final int totalprice;
  final int quantity;
  final int unitprice;
  final String productimg;
  final int discount;

  CartItemsEntity(
      {this.cartid,
      this.productid,
      this.productname,
      this.totalprice,
      this.quantity,
      this.unitprice,
      this.discount,
      this.productimg})
      : super([
          cartid,
          productid,
          productname,
          totalprice,
          quantity,
          unitprice,
          productimg,
          discount
        ]);
}
