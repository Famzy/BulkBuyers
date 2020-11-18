import 'package:bulk_buyers/src/domain/entities/products_entities.dart';
import 'package:equatable/equatable.dart';

class CategoriesEntities extends Equatable {
  final int prodcatid;
  final String prodcatname;
  final String description;
  final int status;
  final String productcatimg;
  final ProductsEntitiy products;

  CategoriesEntities(
      {this.prodcatid,
      this.prodcatname,
      this.description,
      this.status,
      this.productcatimg,
      this.products})
      : super([
          prodcatid,
          prodcatname,
          description,
          status,
          productcatimg,
          products
        ]);
}
