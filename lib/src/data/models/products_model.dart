import 'package:bulk_buyers/src/domain/entities/products_entities.dart';
import 'package:meta/meta.dart';

class ProductsModels extends ProductsEntitiy {
  ProductsModels(
      {@required productid,
      @required prodcatid,
      @required productname,
      @required description,
      @required price,
      @required discount,
      @required quantity,
      @required wishlist,
      @required status,
      @required productimg})
      : super(
            prodcatid: prodcatid,
            productid: productid,
            productname: productname,
            description: description,
            price: price,
            discount: discount,
            quantity: quantity,
            wishlist: wishlist,
            status: status,
            productimg: productimg);

  factory ProductsModels.formJson(Map<String, dynamic> json) {
    return ProductsModels(
        prodcatid: json['prodcatid'],
        productid: json['productid'],
        productname: json['productname'],
        description: json[' description'],
        price: json[' price'],
        discount: json['discount'],
        quantity: json[' quantity'],
        wishlist: json['wishlist'],
        status: json['status'],
        productimg: json[' productimg']);
  }
  Map<String, dynamic> toJson() {
    return {
      'prodcatid': prodcatid,
      'productid': productid,
      'productname': productname,
      'description': description,
      'price': price,
      'discount': discount,
      'quantity': quantity,
      'wishlist': wishlist,
      'status': status,
      'productimg': productimg
    };
  }
}
