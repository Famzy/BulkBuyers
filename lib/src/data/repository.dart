import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/src/data/local/sqflite_database_helper.dart';
import 'package:bulk_buyers/src/data/remote/model/store_api_provider.dart';
import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local/hive_database_helper.dart';
import 'remote/services/store.dart';

class Repository {
  static final Repository _instance = new Repository.internal();
  factory Repository() => _instance;
  Repository.internal();

  HttpClient client = new HttpClient();
  final _root = Constants.BASE_URL;
  var databaseProvider = SqfLiteDatabaseHelper();
  var hiveDBProvider = HiveDatabaseHelper();
  var apiProvider = ApiProvider();
  var productService = ProductService();
  var orderService = OrdersService();
  var userService = UserService();
  var discountService = DiscountService();
  SharedPreferences sharedPreferences;

  Future<List> fetchProducts() async {
    List dbProducts = await databaseProvider.getAllProducts();
    List remoteProducts = await productService.fetchProducts();
    if (dbProducts.length == remoteProducts.length) {
      dbProducts = await productService.fetchProducts();
      await databaseProvider.clearProducts();

      return dbProducts;
    }
    await databaseProvider.clearProducts();
    dbProducts = await productService.fetchProducts();

    await hiveDBProvider.addProducts(dbProducts);
   // await databaseProvider.insertRemoteProducts(dbProducts);
    return dbProducts;
  }

  Future<List> refreshProducts() async {
    print("we don come");
    List productUpdate = await productService.fetchProducts();
    print(productUpdate);
    if (productUpdate.length > 0) {
      print("cleraing DB");
      await databaseProvider.clearProducts();
      print("DB Cleared");
      await databaseProvider.insertRemoteProducts(productUpdate);
      print("Products updated");
      return productUpdate;
    }
    return productUpdate;
  }
  /*Get product Details First check database cif null then check the remote
  * server to fech the item and then save it back into the local DB
  * */

 getProducts(int id) async {
    var item = await databaseProvider.getProduct(id);
    if (item != null) {
      return item;
    }
    item = await apiProvider.fetchProductDetail(id);
    return item;
  }

  Future<List> fetchUserOrders() async {
    print("this is repo");
    List localOrders = await databaseProvider.getOrderList();
    print(localOrders);
    var data = await orderService.fetchOrderList();
    List remoteOrders = data['orders'];
    print(remoteOrders);
    if (remoteOrders.length == localOrders.length) {
      return localOrders;
    } else {
      localOrders = data['orders'];
      await databaseProvider.insertRemoteOrders(localOrders);
      await databaseProvider.insertRemoteOrdersDetails(localOrders);
    }

    return localOrders;
  }

  placeOrders() async {
    //  var result = orderService.postOrders()
  }

  getOrderDetails(int id) async {
    var item = await databaseProvider.getOrderDetails(id);
    if (item != null) {
      return item;
    } else {
      var order = await orderService.fetchOrderDetails(id);
      await databaseProvider.insertRemoteOrdersDetails(order);
      item = await databaseProvider.getOrderDetails(id);
      return item;
    }
  }

  Future<List> fetchUser() async {
    var localUser = await databaseProvider.getUsers();
    var data = await userService.fetchUser();
    var remoteUser = data;
    if (remoteUser.length == localUser.length) {
      return localUser;
    } else {
      print(data);
      await databaseProvider.insertUsers(data);
    }

    return localUser;
  }

  Future<int> logout() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    sharedPreferences.commit();
    var response = await databaseProvider.clearStoreDB();
    return response;
  }
}
