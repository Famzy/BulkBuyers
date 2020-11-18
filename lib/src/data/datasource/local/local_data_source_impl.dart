import 'dart:io';
import 'package:bulk_buyers/src/data/datasource/constants/data_constants.dart';
import 'package:bulk_buyers/src/data/models/cart_model.dart';
import 'package:bulk_buyers/src/data/models/products_model.dart';
import 'package:bulk_buyers/src/data/models/user_model.dart';
import 'package:bulk_buyers/src/domain/entities/products_entities.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'local_data_source.dart';

class LocalDataImpl implements LocalData {
  final SharedPreferences sharedPreferences;
  final LocalStorage storage = new LocalStorage('app_data');
  static Database _db;

  LocalDataImpl({this.sharedPreferences});
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();

    return _db;
  }

  @override
  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "shop.db");

    var storeDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return storeDB;
  }

  @override
  Future<int> addToCart({CartModel shopItems}) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  addToWishList({int productid, bool wishlist}) {
    // TODO: implement addToWishList
    throw UnimplementedError();
  }

  @override
  Future<int> cartTotalPrice() {
    // TODO: implement cartTotalPrice
    throw UnimplementedError();
  }

  @override
  Future<int> cartTotalQuantities() {
    // TODO: implement cartTotalQuantities
    throw UnimplementedError();
  }

  @override
  Future<int> clearCartDB() {
    // TODO: implement clearCartDB
    throw UnimplementedError();
  }

  @override
  Future<int> clearOrderDetails() async {
    var dbClient = await db;
    var response = await dbClient.delete(DBConst.tableOrdersDetails);
    return response;
  }

  @override
  Future<int> clearOrders() {
    // TODO: implement clearOrders
    throw UnimplementedError();
  }

  @override
  Future<int> clearProducts() {
    // TODO: implement clearProducts
    throw UnimplementedError();
  }

  @override
  Future<int> clearStoreDB() {
    // TODO: implement clearStoreDB
    throw UnimplementedError();
  }

  @override
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  @override
  Future<int> deleteCartItems({int id}) {
    // TODO: implement deleteCartItems
    throw UnimplementedError();
  }

  @override
  Future<int> deleteProduct({int id}) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<List> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<List> getCartCheckoutItems() {
    // TODO: implement getCartCheckoutItems
    throw UnimplementedError();
  }

  @override
  Future<int> getCartCount() {
    // TODO: implement getCartCount
    throw UnimplementedError();
  }

  @override
  Future<List> getCartList() {
    // TODO: implement getCartList
    throw UnimplementedError();
  }

  @override
  Future<int> getOrderCount() {
    // TODO: implement getOrderCount
    throw UnimplementedError();
  }

  @override
  getOrderDetails({int id}) {
    // TODO: implement getOrderDetails
    throw UnimplementedError();
  }

  @override
  Future<List> getOrderDetailsList() {
    // TODO: implement getOrderDetailsList
    throw UnimplementedError();
  }

  @override
  Future<int> getOrderDetialsCount() {
    // TODO: implement getOrderDetialsCount
    throw UnimplementedError();
  }

  @override
  Future<List> getOrderList() {
    // TODO: implement getOrderList
    throw UnimplementedError();
  }

  @override
  Future<ProductsModels> getProduct({int id}) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<List> getUsers() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM ${DBConst.tableUser}");
    return result.toList();
  }

  @override
  Future<List> getWishLists() {
    // TODO: implement getWishLists
    throw UnimplementedError();
  }

  @override
  Future<int> insertRemoteOrders({orders}) {
    // TODO: implement insertRemoteOrders
    throw UnimplementedError();
  }

  @override
  Future<int> insertRemoteOrdersDetails({orders}) {
    // TODO: implement insertRemoteOrdersDetails
    throw UnimplementedError();
  }

  @override
  Future<int> insertRemoteProducts({List products}) async {
    List<ProductsModels> product = List<ProductsModels>();
    product = products;
    try {
      var dbClient = await db;
      var response = await dbClient.transaction((tranact) async {
        for (var i = 0; i < products.length; i++) {
          print("Called insert $i to products table");

          ProductsEntitiy shopItems;
          ;
          // shopItems.productid = products[i]["productid"];
//          shopItems.prodcatid = products[i]["prodcatid"];
//          shopItems.productname = products[i]["productname"];
//          shopItems.description = products[i]["description"];
//          shopItems.productimg = products[i]["productimg"];
//          shopItems.price = products[i]["price"];
//          shopItems.discount = products[i]["discount"];
//          shopItems.wishlist = false;
//          shopItems.quantity = 1;

          try {
            var qurries =
                'INSERT INTO ${DBConst.tableShop}(productid,prodcatid,productname,description,productimg,price,quantity,discount,wishlist) VALUES(${shopItems.productid},${shopItems.prodcatid},"${shopItems.productname}","${shopItems.description}","${shopItems.productimg}", ${shopItems.price},${shopItems.quantity},${shopItems.discount},${shopItems.wishlist ? 1 : 0})';
            var response = await tranact.rawInsert(qurries);
            print(response);
          } catch (exception) {
            print("ERRR ==> ??insertRemoteData inner?? <==");
            print("this ihe error: $exception");
          }
        }
        storage.setItem("isFirst", "true");
      });
      return response;
    } catch (exception) {
      print("ERRR ==> ??insertRemoteData?? <==");
      print(exception);
    }
  }

  @override
  Future<int> insertUsers({UserModels users}) async {
    try {
      var dbClient = await db;
      var response = await dbClient.transaction((tranact) async {
        for (var i = 0; i < 1; i++) {
          try {
            var qurries =
                'INSERT INTO ${DBConst.tableUser}(userid,stateid,fname,lname,dob,address,profileimg,email,phone,created_at) VALUES'
                '(${users.userid},${users.stateid},"${users.fname}","${users.lname}","${users.dob}", "${users.address}","${users.profileimg}","${users.email}",${users.phone},"${users.created_at}")';
            var response = await tranact.rawInsert(qurries);
            print(response);
          } catch (exception) {
            print("ERRR ==> ??insertUser inner?? <==");
            print("this ihe error: $exception");
          }
        }
        storage.setItem("isFirst", "true");
      });
      return response;
    } catch (exception) {
      print("ERRR ==> ??insertUser <==");
      print(exception);
    }
  }

  @override
  updateCartPriceAndQty({int productid, int price, int qty}) {
    // TODO: implement updateCartPriceAndQty
    throw UnimplementedError();
  }

  @override
  updateUserDeatails(
      {int UserId,
      String firstName,
      String LastName,
      String address,
      String dob}) {
    // TODO: implement updateUserDeatails
    throw UnimplementedError();
  }

  void _onCreate(Database db, int version) async {
    await db.execute("""CREATE TABLE ${DBConst.tableShop} (
        ${DBConst.ColumnProdID} INTEGER PRIMARY KEY,
        ${DBConst.ColumnProdCatID} INTEGER,
        ${DBConst.ColumnProdName} TEXT,
        ${DBConst.ColumnDescrpt} Text,
        ${DBConst.ColumnProdImg} TEXT,
        ${DBConst.ColumnProdPrice} INTEGER,
        ${DBConst.ColumnProdQty} INTEGER,
        ${DBConst.ColumnProdDiscnt} INTEGER,
        ${DBConst.ColumnProdWishLst} INTEGER
        )""");

    await db.execute("""CREATE TABLE ${DBConst.tableCart} (
        ${DBConst.ColumnCartID} INTEGER PRIMARY KEY,
        ${DBConst.ColumnProdID} INTEGER,
        ${DBConst.ColumnProdName} TEXT,
        ${DBConst.ColumnProdImg} TEXT,
        ${DBConst.ColumnProdTotalPrice} INTEGER,
        ${DBConst.ColumnProdUnitPrice} INTEGER,
        ${DBConst.ColumnProdQty} INTEGER,
        ${DBConst.ColumnProdDiscnt} INTEGER
        )""");
    await db.execute("""CREATE TABLE ${DBConst.tableOrders} (
        ${DBConst.ColumnOrderID} INTEGER PRIMARY KEY,  
        ${DBConst.ColumnUserID} INTEGER, 
        ${DBConst.ColumnOrderStatID} INTEGER,
        ${DBConst.ColumnOrderRefNum} TEXT,
        ${DBConst.ColumnTotalCost} REAL,
        ${DBConst.ColumnOrderQTY} INTEGER,
        ${DBConst.ColumnProdDiscnt} REAL,
        ${DBConst.ColumnPaid} INTEGER,
        ${DBConst.ColumnOrderDetils} BLOB,
        ${DBConst.ColumnOrderTime} DATETIME
        )""");
    await db.execute("""CREATE TABLE ${DBConst.tableOrdersDetails} (
        ${DBConst.ColumnOrderDetilsID} INTEGER PRIMARY KEY,   
        ${DBConst.ColumnOrderID} INTEGER  ,   
        ${DBConst.ColumnProdID} INTEGER,  
        ${DBConst.ColumnProdName} TEXT,
        ${DBConst.ColumnDescrpt} TEXT,
        ${DBConst.ColumnProdQty} INTEGER,
        ${DBConst.ColumnProdUnitPrice} INTEGER, 
        ${DBConst.ColumnProdTotalPrice} REAL,   
        ${DBConst.ColumnOrderTime} DATETIME
        )""");
    await db.execute("""CREATE TABLE ${DBConst.tableUser} (
       ${DBConst.ColumnUserID} INTEGER PRIMARY KEY,
        ${DBConst.ColumnStatID} INTEGER,
        ${DBConst.ColumnFName} TEXT,
        ${DBConst.ColumnLName} TEXT,
        ${DBConst.ColumnDOB} TEXT,
        ${DBConst.ColumnAddress} TEXT,
        ${DBConst.ColumnEmail} TEXT,
        ${DBConst.ColumnProfImg} TEXT,
        ${DBConst.ColumnPhone} INTEGER,
        ${DBConst.ColumnCreated} TEXT
        )""");
    await db.execute("""CREATE TABLE ${DBConst.tableCategories} (
        ${DBConst.ColumnProdCatID} INTEGER PRIMARY KEY,
        ${DBConst.ColumnProdCatName} TEXT,
        ${DBConst.ColumnDescrpt} TEXT,
        ${DBConst.ColumnStatus} INTEGER,
        ${DBConst.ColumnCatImg} TEXT,
        ${DBConst.ColumnProd} BLOB
        )""");
  }
}
