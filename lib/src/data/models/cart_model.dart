import 'package:bulk_buyers/src/domain/entities/cart_items_entity.dart';
import 'package:meta/meta.dart';

class CartModel extends CartItemsEntity {
  CartModel(
      {@required cartid,
      @required productid,
      @required productname,
      @required totalprice,
      @required quantity,
      @required unitprice,
      @required discount,
      @required productimg})
      : super(
            cartid: cartid,
            productid: productid,
            productname: productname,
            totalprice: totalprice,
            quantity: quantity,
            unitprice: unitprice,
            discount: discount,
            productimg: productimg);

  Map<String, Object> toMap() {
    var map = new Map<String, Object>();

    if (cartid != null) {
      map['cartid'] = cartid;
    }
    map['productid'] = productid;
    map['productname'] = productname;
    map['quantity'] = quantity;
    map['totalprice'] = totalprice;
    map['unitprice'] = unitprice;
    map['productimg'] = productimg;
    map['discount'] = discount;

    return map;
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
        cartid: map['cartid'],
        productid: map['productid'],
        productname: map['productname'],
        productimg: map['productimg'],
        totalprice: map['totalprice'],
        unitprice: map['unitprice'],
        quantity: map['quantity'],
        discount: map['discount']);
  }

  factory CartModel.formJson(Map<String, dynamic> json) {
    return CartModel(
        cartid: json['cartid'],
        productid: json['productid'],
        productname: json['productname'],
        productimg: json['productimg'],
        totalprice: json['totalprice'],
        unitprice: json['unitprice'],
        quantity: json['quantity'],
        discount: json['discount']);
  }
}
