//import 'package:hive/hive.dart';
//part 'shop_hive_model.g.dart';
//@HiveType()
//class ShopHiveModle {
//  @HiveField(0)
//  int productid;
//  @HiveField(1)
//  int prodcatid;
//  @HiveField(2)
//  String productname;
//  @HiveField(3)
//  String description;
//  @HiveField(4)
//  int price;
//  @HiveField(5)
//  int discount;
//  @HiveField(6)
//  int quantity;
//  @HiveField(7)
//  bool wishlist;
//  @HiveField(8)
//  String productimg;
//
//  ShopHiveModle(
//      this.productid,
//        this.prodcatid,
//        this.productname,
//        this.description,
//        this.price,
//        this.discount,
//        this.quantity,
//        this.wishlist,
//        this.productimg);
//
//  ShopHiveModle.fromJson(
//      Map<String, dynamic> data,
//      )   : productid = data['productid'],
//        productname = data['productname'],
//        prodcatid = data['prodcatid'],
//        description = data['description'],
//        price = data['price'],
//        discount = data['discount'],
//        productimg = data['productimg'];
//
//// for Local DB
//  ShopHiveModle.map(dynamic object) {
//    this.productid = object['productid'];
//    this.productname = object['productname'];
//    this.prodcatid = object['prodcatid'];
//    this.description = object['description'];
//    this.price = object['price'];
//    this.quantity = object['quantity'];
//    this.discount = object['discount'];
//    this.wishlist = object['wishlist'] == 1;
//    this.productimg = object['productimg'];
//  }
//// for Local DB
//  Map<String, dynamic> toMap() {
//    var map = new Map<String, dynamic>();
//
//    if (productid != null) {
//      map['productid'] = productid;
//    }
//    map['prodcatid'] = prodcatid;
//    map['productname'] = productname;
//    map['description'] = description;
//    map['quantity'] = quantity;
//    map['price'] = price;
//    map['discount'] = discount;
//    map['wishlist'] = wishlist == 1;
//    map['productimg'] = productimg;
//
//    return map;
//  }
//
//// for Local DB
//  ShopHiveModle.fromMap(
//      Map<String, dynamic> map,
//      ) {
//    this.productid = map['productid'];
//    this.productname = map['productname'];
//    this.prodcatid = map['prodcatid'];
//    this.description = map['description'];
//    this.price = map['price'];
//    this.discount = map['discount'];
//    this.productimg = map['productimg'];
//    this.wishlist = map['wishlist'] == 1;
//    this.quantity = map['quantity'];
//  }
//
//}
//
//
