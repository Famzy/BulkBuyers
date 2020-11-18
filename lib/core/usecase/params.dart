import 'package:bulk_buyers/src/domain/entities/products_entities.dart';
import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final int productid;
  final int prodcatid;
  final String prodcatname;
  final String description;
  final int status;
  final int price;
  final int discount;
  final String productcatimg;
  final bool wishlist;
  final int quantity;
  final String productimg;
  final ProductsEntitiy products;

  Params(
      {this.productid,
      this.prodcatid,
      this.prodcatname,
      this.description,
      this.status,
      this.price,
      this.quantity,
      this.wishlist,
      this.discount,
      this.productcatimg,
      this.productimg,
      this.products})
      : super([
          productid,
          prodcatid,
          prodcatname,
          description,
          status,
          price,
          discount,
          quantity,
          wishlist,
          productcatimg,
          products,
          productimg
        ]);
}

class NoParams extends Equatable {}
