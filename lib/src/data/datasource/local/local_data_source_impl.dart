import 'dart:io';
import 'package:bulk_buyers/core/error/exceptions.dart';
import 'package:bulk_buyers/core/error/failures.dart';
import 'package:bulk_buyers/core/utils/bulk_buyers_strings.dart';
import 'package:bulk_buyers/src/data/datasource/constants/data_constants.dart';
import 'package:bulk_buyers/src/data/models/cart_model.dart';
import 'package:bulk_buyers/src/data/models/order_details_model.dart';
import 'package:bulk_buyers/src/data/models/products_model.dart';
import 'package:bulk_buyers/src/data/models/user_model.dart';
import 'package:bulk_buyers/src/domain/entities/products_entities.dart';
import 'package:dartz/dartz.dart';
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
  //
  // @override
  // Future<int> addToCart({CartModel shopItems}) async {
  //   var dbClient = await db;
  //   var res = await dbClient.transaction((tranact) async {
  //     try {
  //       var qurries =
  //           'INSERT INTO ${DBConst.cartTable}(productid,productname,productimg, totalprice,unitprice,quantity,discount) VALUES(${shopItems.productid},"${shopItems.productname}","${shopItems.productimg}",${shopItems.totalprice},${shopItems.unitprice}, ${shopItems.quantity}, ${shopItems.discount})';
  //       var response = await tranact.rawInsert(qurries);
  //       print(response);
  //     } catch (exception) {
  //       print("ERRR ==> ??InsertInCart?? <==");
  //       print(exception);
  //     }
  //     storage.setItem("isFirst", "true");
  //   });
  //   print("this is $res");
  //   return res;
  // }

  @override
  Future<int> addToCart({List<CartModel> cart}) async {
    try {
      print("To Be inserted: ");
      var dbClient = await db;
      var response = await dbClient.transaction((tranact) async {
        for (var i = 0; i < cart.length; i++) {
          print("Called insert $i to carts table");

          CartModel shopItems = cart[i];
          print("To Be inserted: ${shopItems.productimg}");
          try {
            var qurries =
                'INSERT INTO ${DBConst.cartTable}(productid,productname,productimg, totalprice,unitprice,quantity,discount) VALUES(${shopItems.productid},"${shopItems.productname}","${shopItems.productimg}",${shopItems.totalprice},${shopItems.unitprice}, ${shopItems.quantity}, ${shopItems.discount})';
            var response = await tranact.rawInsert(qurries);
            print(response);
          } catch (exception) {
            print("ERRR ==> ??insertCartData inner?? <==");
            print("this ihe error: $exception");
          }
        }
        storage.setItem("isFirst", "true");
      });
      return response;
    } catch (exception) {
      print("ERRR ==> ??insertCartData?? <==");
      print(exception);
    }
  }

  @override
  addToWishList({int productid, bool wishlist}) async {
    print(
        "this was hit %% Update WishList to update is $productid with value $wishlist %%");
    var dbClient = await db;
    try {
      var qry =
          "UPDATE ${DBConst.tableShop} set wishlist = ${wishlist ? 1 : 0} where productid = $productid";
      dbClient.rawUpdate(qry).then((res) {
        print("UPDATE RES $res");
      }).catchError((e) {
        print("UPDATE ERR $e");
      });
    } catch (e) {
      print("ERRR @@");
      print(e);
    }
  }

  @override
  Future<int> cartTotalPrice() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient
        .rawQuery("SELECT SUM(totalprice) FROM ${DBConst.cartTable}"));
  }

  @override
  Future<int> cartTotalQuantities() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient
        .rawQuery("SELECT SUM(quantity) FROM ${DBConst.cartTable}"));
  }

  @override
  Future<int> clearCartDB() async {
    var dbClient = await db;

    var response = await dbClient.delete(DBConst.cartTable);
    return response;
  }

  @override
  Future<int> clearOrderDetails() async {
    var dbClient = await db;
    var response = await dbClient.delete(DBConst.tableOrdersDetails);
    return response;
  }

  @override
  Future<int> clearOrders() async {
    var dbClient = await db;
    var response = await dbClient.delete(DBConst.tableOrders);
    return response;
  }

  @override
  Future<int> clearProducts() async {
    var dbClient = await db;
    var response = await dbClient.delete(DBConst.tableShop);
    return response;
  }

  @override
  Future<int> clearStoreDB() async {
    var dbClient = await db;
    var response = await dbClient.delete(DBConst.cartTable);
    response = await dbClient.delete(DBConst.tableShop);
    response = await dbClient.delete(DBConst.tableOrders);
    response = await dbClient.delete(DBConst.tableCategories);
    response = await dbClient.delete(DBConst.tableUser);
    response = await dbClient.delete(DBConst.tableOrdersDetails);
    return response;
  }

  @override
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }

  @override
  Future<int> deleteCartItems({int id}) async {
    var dbClient = await db;
    return await dbClient.delete(DBConst.cartTable,
        where: "${DBConst.ColumnCartID} = ?", whereArgs: [id]);
  }

  @override
  Future<int> deleteProduct({int id}) async {
    var dbClient = await db;
    return await dbClient.delete(DBConst.tableShop,
        where: "${DBConst.ColumnProdID} = ?", whereArgs: [id]);
  }

  @override
  Future<List> getCartCheckoutItems() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT ${DBConst.ColumnProdID}, ${DBConst.ColumnProdQty}, ${DBConst.ColumnProdUnitPrice}, ${DBConst.ColumnProdTotalPrice}, ${DBConst.ColumnProdDiscnt} FROM ${DBConst.cartTable}");

    return result.toList();
  }

  @override
  Future<int> getCartCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM ${DBConst.cartTable}"));
  }

  @override
  Future<List<CartModel>> getCartList() async {
    try {
      var dbClient = await db;
      var result =
          await dbClient.rawQuery("SELECT * FROM ${DBConst.cartTable}");
      print("this is result $result");

      Iterable list = result;

      return list.map((model) => CartModel.formJson(model)).toList();
    } catch (e, s) {
      print({e, s});
    }
  }

  @override
  Future<int> getOrderCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM ${DBConst.tableOrders}"));
  }

  @override
  Future<int> getProCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM ${DBConst.tableShop}"));
  }

  @override
  getOrderDetails({int id}) async {
    var dbClient = await db;

    var result = await dbClient.rawQuery(
        "SELECT * FROM  ${DBConst.tableOrdersDetails} WHERE ${DBConst.ColumnOrderID} = $id");
    if (result.length == 0) return null;

    //gets the firts itm on the table
    return result;
  }

  @override
  Future<List> getOrderDetailsList() async {
    var dbClient = await db;
    var result =
        await dbClient.rawQuery("SELECT * FROM ${DBConst.tableOrdersDetails}");

    return result.toList();
  }

  @override
  Future<int> getOrderDetialsCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient
        .rawQuery("SELECT COUNT(*) FROM ${DBConst.tableOrdersDetails}"));
  }

  @override
  Future<List> getOrderList() async {
    var dbClient = await db;
    var result =
        await dbClient.rawQuery("SELECT * FROM ${DBConst.tableOrders}");

    return result.toList();
  }

  @override
  Future<ProductsModels> getProduct({int id}) async {
    var dbClient = await db;

    var result = await dbClient.rawQuery(
        "SELECT * FROM ${DBConst.tableShop} WHERE ${DBConst.ColumnProdID} = $id");
    if (result.length == 0) return null;

    //gets the firts itm on the table
    return new ProductsModels.formJson(result.first);
  }

  @override
  Future<List> getUsers() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM ${DBConst.tableUser}");
    return result.toList();
  }

  @override
  Future<List<ProductsModels>> getWishLists() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM ${DBConst.tableShop} WHERE ${DBConst.ColumnProdWishLst} = 1");
    Iterable list = result;

    return list.map((model) => ProductsModels.formJson(model)).toList();
  }

  @override
  Future<int> insertRemoteProducts({List<ProductsModels> products}) async {
    try {
      print("To Be inserted: ");
      var dbClient = await db;
      var response = await dbClient.transaction((tranact) async {
        for (var i = 0; i < products.length; i++) {
          print("Called insert $i to products table");

          ProductsModels model = products[i];
          print("To Be inserted:${model.description} ${model.productimg}");
          try {
            var qurries =
                'INSERT INTO ${DBConst.tableShop}(productid,prodcatid,productname,description,productimg,price,quantity,discount,wishlist) VALUES(${model.productid},${model.prodcatid},"${model.productname}","${model.description}","${model.productimg}", ${model.price},${model.quantity},${model.discount},${model.wishlist ? 1 : 0})';
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
  Future<Either<Failure, List<ProductsEntitiy>>> filterProducts(
      {int id}) async {
    print("this is cat id: $id");
    var dbClient = await db;

    try {
      var result = await dbClient.rawQuery(
          "SELECT * FROM  ${DBConst.tableShop} WHERE ${DBConst.ColumnProdCatID} = $id");
      print("ths res $result");
      if (result.length == 0) return null;
      //gets the firts itm on the table
      Iterable list = result;
      return Right(
          list.map((model) => ProductsModels.formJson(model)).toList());
    } catch (e, s) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<List<ProductsEntitiy>> getAllProducts() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM  ${DBConst.tableShop}");
    if (result.length == 0) return null;
    //gets the firts itm on the table
    Iterable list = result;
    return list.map((model) => ProductsModels.formJson(model)).toList();
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
  updateCartPriceAndQty({int productid, int price, int qty}) async {
    var dbClient = await db;
    try {
      var qry =
          "UPDATE ${DBConst.cartTable} set totalprice = $price,quantity = $qty where productid = $productid";
      dbClient.rawUpdate(qry).then((res) {
        print("UPDATE RES $res");
      }).catchError((e) {
        print("UPDATE ERR $e");
      });
    } catch (e) {
      print("ERRR @@");
      print(e);
    }
  }

  @override
  Future<int> insertRemoteOrders({List<OrdersModel> orders}) async {
    try {
      var dbClient = await db;
      var response = await dbClient.transaction((tranact) async {
        for (var i = 0; i < orders.length; i++) {
          print("Called insert $i: to orders table");
          OrdersModel model = orders[i];
          try {
            var qurries =
                'INSERT INTO ${DBConst.tableOrders}(orderid,userid,orderstatid,orderrefno,totalcost,qty,discount,ispaid,orderdetails,created_at) VALUES'
                '(${model.orderid},${model.userid},${model.orderstatid},"${model.orderrefno}",${model.totalcost}, ${model.qty},${model.discount},${model.ispaid ? 1 : 0},"${model.created_at}")';
            var response = await tranact.rawInsert(qurries);
            print(response);
          } catch (exception) {
            print("ERRR ==> ??insertRemoteOrders inner?? <==");
            print("this ihe error: $exception");
          }
        }
        storage.setItem("isFirst", "true");
      });
      return response;
    } catch (exception) {
      print("ERRR ==> ??insertRemoteOrders?? <==");
      print(exception);
    }
  }

  @override
  Future<int> insertRemoteOrdersDetails({OrderDetailsModel orders}) async {
    var dbClient = await db;
    var response = await dbClient.transaction((tranact) async {
      try {
        var qurries =
            'INSERT INTO ${DBConst.tableOrdersDetails}(orderdetailid,orderid,productid,quantity,unitprice,totalprice,productname,description,created_at) VALUES'
            '(${orders.orderdetailid},${orders.orderid},${orders.productid},${orders.quantity}, ${orders.unitprice},${orders.totalprice},"${orders.productname}","${orders.description}","${orders.created_at}")';
        var response = await tranact.rawInsert(qurries);
        print(response);
      } catch (exception) {
        print("ERRR ==> ??insert Remote Orders Detils Inner?? <==");
        print("this ihe error: $exception");
      }
    });
    return response;
  }

  @override
  updateUserDeatails(
      {int UserId,
      String firstName,
      String LastName,
      String address,
      String dob}) async {
    var dbClient = await db;
    try {
      var qry =
          "UPDATE ${DBConst.tableUser} set fname = '$firstName',lname = '$LastName', address = '$address', dob = '$dob'  where userid = $UserId";
      dbClient.rawUpdate(qry).then((res) {
        print("UPDATE RES $res");
      }).catchError((e) {
        print("UPDATE ERR $e");
      });
    } catch (e) {
      print("ERRR @@");
      print(e);
    }
  }

  void _onCreate(Database db, int version) async {
    await db.execute("""CREATE TABLE ${DBConst.cartTable} (
        ${DBConst.ColumnCartID} INTEGER PRIMARY KEY,
        ${DBConst.ColumnProdID} INTEGER,
        ${DBConst.ColumnProdName} TEXT,
        ${DBConst.ColumnProdImg} TEXT,
        ${DBConst.ColumnProdTotalPrice} INTEGER,
        ${DBConst.ColumnProdUnitPrice} INTEGER,
        ${DBConst.ColumnProdQty} INTEGER,
        ${DBConst.ColumnProdDiscnt} INTEGER
        )""");
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

    await db.execute("""CREATE TABLE ${DBConst.tableOrders} (
        ${DBConst.ColumnOrderID} INTEGER PRIMARY KEY,  
        ${DBConst.ColumnUserID} INTEGER, 
        ${DBConst.ColumnOrderStatID} INTEGER,
        ${DBConst.ColumnOrderRefNum} TEXT,
        ${DBConst.ColumnTotalCost} REAL,
        ${DBConst.ColumnOrderQTY} INTEGER,
        ${DBConst.ColumnProdDiscnt} REAL,
        ${DBConst.ColumnPaid} INTEGER,
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

  @override
  Future<void> cacheToken({String token}) {
    return sharedPreferences.setString(BCStrings.CACHE_TOKEN, token.toString());
  }

  @override
  Future<String> getToken() {
    final token = sharedPreferences.getString(BCStrings.CACHE_TOKEN);
    if (token != null) {
      return Future.value(token);
    } else {
      throw CacheException(BCStrings.CACHE_FAILURE_MESSAGE);
    }
  }

  @override
  Future<void> cacheState({String state}) {
    return sharedPreferences.setString(BCStrings.CACHE_STATE, state.toString());
  }
}
