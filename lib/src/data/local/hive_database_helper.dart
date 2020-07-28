import 'package:bulk_buyers/src/data/remote/model/store_api_provider.dart';
import 'package:hive/hive.dart';
import 'package:bulk_buyers/src/models/shop_model.dart';

var api = new ApiProvider();

class HiveDatabaseHelper {

  static final HiveDatabaseHelper _instance = new HiveDatabaseHelper.internal();
  factory HiveDatabaseHelper() => _instance;
  HiveDatabaseHelper.internal();


  void _onCreate() async {
    final productsBox = await Hive.openBox("products");
  }

  void addProducts(var product ) async {
    final goods = Hive.box('store_products');
    for (var i = 0; i < goods.length; i++) {
      Shop shopItems = new Shop();
      shopItems.productid = product[i]["productid"];
      shopItems.prodcatid = product[i]["prodcatid"];
      shopItems.productname = product[i]["productname"];
      shopItems.description = product[i]["description"];
      shopItems.productimg = product[i]["productimg"];
      shopItems.price = product[i]["price"];
      shopItems.discount = product[i]["discount"];
      shopItems.wishlist = false;
      shopItems.quantity = 1;
      goods.add(shopItems);
    }
  }
}