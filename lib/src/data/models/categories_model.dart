import 'package:bulk_buyers/src/domain/entities/categories_entities.dart';
import 'package:bulk_buyers/src/domain/entities/products_entities.dart';
import 'package:meta/meta.dart';

class CategoriesModel extends CategoriesEntities {
  CategoriesModel(
      {@required prodcatid,
      @required prodcatname,
      @required description,
      @required status,
      @required productcatimg,
      @required products})
      : super(
          prodcatid: prodcatid,
          prodcatname: prodcatname,
          description: description,
          status: status,
          productcatimg: productcatimg,
          products: products,
        );

  factory CategoriesModel.formJson(Map<String, dynamic> json) {
    var productsFromJson = json['quantity'];
    List<CategoriesEntities> productList =
        new List<CategoriesEntities>.from(productsFromJson);
    return CategoriesModel(
      prodcatid: json['prodcatid'],
      prodcatname: json['prodcatname'],
      description: json['description'],
      status: json['status'],
      productcatimg: json['productcatimg'],
      products: productList,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'prodcatid': prodcatid,
      'productname': prodcatname,
      'description': description,
      'status': status,
      'productcatimg': productcatimg,
      'products': products,
    };
  }
}
