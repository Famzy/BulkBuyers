class HiveDatabaseHelper {
  static final HiveDatabaseHelper _instance = new HiveDatabaseHelper.internal();
  factory HiveDatabaseHelper() => _instance;
  HiveDatabaseHelper.internal();

  void addProducts(var product) async {
//  print("I was hit");
//    final goods = Hive.box('store_products');
//    for (var i = 0; i < product.length; i++) {
//      print("products $i inserted");
//
//      Shop shopItems = Shop();
//      shopItems.productid = product[i]["productid"];
//      shopItems.prodcatid = product[i]["prodcatid"];
//      shopItems.productname = product[i]["productname"];
//      shopItems.description = product[i]["description"];
//      shopItems.productimg = product[i]["productimg"];
//      shopItems.price = product[i]["price"];
//      shopItems.discount = product[i]["discount"];
//      shopItems.wishlist = false;
//      shopItems.quantity = 1;
//      print("This are the items: PrId: ${shopItems.productid} PrCatId: ${shopItems.prodcatid} PrName: ${shopItems.productname} PrDesc: ${shopItems.description} PrPrice: ${shopItems.price} PrDisc: ${shopItems.discount} PrQTY ${shopItems.quantity} PrWshLst: ${shopItems.wishlist} PrImg: ${shopItems.productimg}");
//      ShopHiveModle good = new ShopHiveModle(shopItems.productid,shopItems.prodcatid, shopItems.productname, shopItems.description,  shopItems.price,  shopItems.discount,  shopItems.quantity,  shopItems.wishlist, shopItems.productimg);
//      goods.add(good);
//    }
  }
}
