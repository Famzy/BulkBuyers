import 'package:hive/hive.dart';
part 'shop_hive_model.g.dart';
@HiveType()
class ShopHiveModle {
  @HiveField(0)
  int productid;
  @HiveField(1)
  int prodcatid;
  @HiveField(2)
  String productname;
  @HiveField(3)
  String description;
  @HiveField(4)
  int price;
  @HiveField(5)
  int discount;
  @HiveField(6)
  int quantity;
  @HiveField(7)
  bool wishlist;
  @HiveField(8)
  String productimg;

  ShopHiveModle(
      {this.productid,
        this.prodcatid,
        this.productname,
        this.description,
        this.price,
        this.discount,
        this.quantity,
        this.wishlist,
        this.productimg});

}
