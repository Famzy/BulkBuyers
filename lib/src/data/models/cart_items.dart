import 'package:bulk_buyers/src/domain/entities/cart_items_entity.dart';
import 'package:meta/meta.dart';

class CartItemsModel extends CartItemsEntity {
  CartItemsModel(
      {@required cartid,
      @required productid,
      @required productname,
      @required totalprice,
      @required quantity,
      @required unitprice,
      @required productimg});

  factory CartItemsModel.formJson(Map<String, dynamic> json) {
    return CartItemsModel(
      cartid: json['cartid'],
      productid: json['productid'],
      productname: json['productname'],
      totalprice: json["totalprice"],
      quantity: json['quantity'],
      unitprice: json['unitprice'],
      productimg: json['productimg'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> cart = new Map<String, dynamic>();

    cart['cartid'] = cartid;
    cart['productid'] = productid;
    cart['productname'] = productname;
    cart['totalprice'] = totalprice;
    cart['quantity'] = quantity;
    cart['unitprice'] = unitprice;
    cart['productimg'] = productimg;
    return cart;
  }
}
