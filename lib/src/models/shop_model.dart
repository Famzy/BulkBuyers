import 'package:hive/hive.dart';

class Shop {
  int productid;
  int prodcatid;
  String productname;
  String description;
  int price;
  int discount;
  int quantity;
  bool wishlist;
  String productimg;

  Shop(
      {this.productid,
      this.prodcatid,
      this.productname,
      this.description,
      this.price,
      this.discount,
      this.quantity,
      this.wishlist,
      this.productimg});
//
  Shop.fromJson(
    Map<String, dynamic> data,
  )   : productid = data['productid'],
        productname = data['productname'],
        prodcatid = data['prodcatid'],
        description = data['description'],
        price = data['price'],
        discount = data['discount'],
        productimg = data['productimg'];

// for Local DB
  Shop.map(dynamic object) {
    this.productid = object['productid'];
    this.productname = object['productname'];
    this.prodcatid = object['prodcatid'];
    this.description = object['description'];
    this.price = object['price'];
    this.quantity = object['quantity'];
    this.discount = object['discount'];
    this.wishlist = object['wishlist'] == 1;
    this.productimg = object['productimg'];
  }
// for Local DB
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    if (productid != null) {
      map['productid'] = productid;
    }
    map['prodcatid'] = prodcatid;
    map['productname'] = productname;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    map['discount'] = discount;
    map['wishlist'] = wishlist == 1;
    map['productimg'] = productimg;

    return map;
  }

// for Local DB
  Shop.fromMap(
    Map<String, dynamic> map,
  ) {
    this.productid = map['productid'];
    this.productname = map['productname'];
    this.prodcatid = map['prodcatid'];
    this.description = map['description'];
    this.price = map['price'];
    this.discount = map['discount'];
    this.productimg = map['productimg'];
    this.wishlist = map['wishlist'] == 1;
    this.quantity = map['quantity'];
  }
//  int get productid => _productid;
//  String get productname => _productname;
//  int get prodcatid => _prodcatid;
//  int get quantity => _quantity;
//  int get wishlist => _wishlist;
//  int get discount => _discount;
//  int get price => _price;
//  String get productimg => _productimg;
//  String get description => _description;
}
