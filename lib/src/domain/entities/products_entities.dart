import 'package:equatable/equatable.dart';

class ProductsEntitiy extends Equatable {
  final int productid;
  final int prodcatid;
  final String productname;
  final String description;
  final int price;
  final int discount;
  final int status;
  final bool wishlist;
  final int quantity;
  final String productimg;

  ProductsEntitiy(
      {this.productid,
      this.prodcatid,
      this.productname,
      this.description,
      this.price,
      this.discount,
      this.quantity,
      this.wishlist,
      this.status,
      this.productimg})
      : super([
          prodcatid,
          prodcatid,
          productname,
          description,
          price,
          discount,
          status,
          quantity,
          wishlist,
          productimg
        ]);
}
