import 'dart:io';

import 'package:bulk_buyers/src/data/datasource/constants/data_constants.dart';
import 'package:bulk_buyers/src/data/models/cart_model.dart';
import 'package:bulk_buyers/src/data/models/order_details_model.dart';
import 'package:bulk_buyers/src/data/models/order_products_model.dart';
import 'package:bulk_buyers/src/data/models/orders_model.dart';
import 'package:bulk_buyers/src/data/models/shop_model.dart';
import 'package:localstorage/localstorage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfLiteDatabaseHelper {
  ///
  ///   Project Bulk Buyers
  ///  Class Name [SqfLiteDatabaseHelper]
  ///  Description : Function this class is meant to handle all basic CURD functions eliminating
  ///  making CURD on the Main UI Thread.
  ///  Author:  Eric Lekwa
  ///  Created : [9:4:20  12:50]
  ///  Last Upadted : null
  ///
  ///
  static final SqfLiteDatabaseHelper _instance =
      new SqfLiteDatabaseHelper.internal();
  final LocalStorage storage = new LocalStorage('app_data');

  factory SqfLiteDatabaseHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();

    return _db;
  }

  // var api = new ApiProvider();

  SqfLiteDatabaseHelper.internal();

  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "shop.db");

    var storeDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return storeDB;
  }

  //CRUD - CREATE, READ, UPDATE, DELETE
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

  ///This is responsible for inserting Items into the local database

  Future<int> insertRemoteProducts(var products) async {
    try {
      var dbClient = await db;
      var response = await dbClient.transaction((tranact) async {
        for (var i = 0; i < products.length; i++) {
          print("Called insert $i to products table");

          Shop shopItems = new Shop();
          shopItems.productid = products[i]["productid"];
          shopItems.prodcatid = products[i]["prodcatid"];
          shopItems.productname = products[i]["productname"];
          shopItems.description = products[i]["description"];
          shopItems.productimg = products[i]["productimg"];
          shopItems.price = products[i]["price"];
          shopItems.discount = products[i]["discount"];
          shopItems.wishlist = false;
          shopItems.quantity = 1;

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

//Read all Products in the Products Database
  Future<List> getAllProducts() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM ${DBConst.tableShop}");

    return result.toList();
  }

  //get products form  the store database
  Future<Shop> getProduct(int id) async {
    var dbClient = await db;

    var result = await dbClient.rawQuery(
        "SELECT * FROM ${DBConst.tableShop} WHERE ${DBConst.ColumnProdID} = $id");
    if (result.length == 0) return null;

    //gets the firts itm on the table
    return new Shop.fromMap(result.first);
  }

  //Delete Products
  Future<int> deleteProduct(int id) async {
    var dbClient = await db;

    return await dbClient.delete(DBConst.tableShop,
        where: "${DBConst.ColumnProdID} = ?", whereArgs: [id]);
  }

//this is triggered when the user logs out.
  Future<int> clearStoreDB() async {
    var dbClient = await db;
    var response = await dbClient.delete(DBConst.tableCart);
    response = await dbClient.delete(DBConst.tableShop);
    response = await dbClient.delete(DBConst.tableOrders);
    response = await dbClient.delete(DBConst.tableCategories);
    response = await dbClient.delete(DBConst.tableUser);
    response = await dbClient.delete(DBConst.tableOrdersDetails);
    return response;
  }

  Future<int> clearProducts() async {
    var dbClient = await db;
    var response = await dbClient.delete(DBConst.tableShop);
    return response;
  }

  addToWishList(int productid, bool wishlist) async {
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

  Future<List> getWishLists() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM ${DBConst.tableShop} WHERE ${DBConst.ColumnProdWishLst} = 1");

    return result.toList();
  }

  ///Cart Section
  Future<int> addToCart(CartModel shopItems) async {
    var dbClient = await db;
    await dbClient.transaction((tranact) async {
      try {
        var queries =
            'INSERT INTO ${DBConst.tableCart}(productid,productname,productimg, totalprice,unitprice,quantity,discount) VALUES(${shopItems.productid},"${shopItems.productname}","${shopItems.productimg}",${shopItems.totalprice},${shopItems.unitprice}, ${shopItems.quantity}, ${shopItems.discount})';
        var _response = await tranact.execute(queries);
        return _response;
      } catch (exception) {
        print("ERRR ==> ??InsertInCart?? <==");
        print(exception);
      }
    });
  }

  updateCartPriceAndQty(int productid, int price, int qty) async {
    print(
        'This is the id: $productid, this is the current price: $price and this is the current Qty: $qty');
    var dbClient = await db;
    try {
      var qry =
          "UPDATE ${DBConst.tableCart} set totalprice = $price,quantity = $qty where productid = $productid";
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

  //Read all Products in the Carts Database
  Future<List> getCartList() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM ${DBConst.tableCart}");

    return result.toList();
  }

  //get the count of data's in the the DB
  Future<int> getCartCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM ${DBConst.tableCart}"));
  }

  //Delete Cart Items
  Future<int> deleteCartItems(int id) async {
    var dbClient = await db;

    return await dbClient.delete(DBConst.tableCart,
        where: "${DBConst.ColumnCartID} = ?", whereArgs: [id]);
  }

  Future<int> clearCartDB() async {
    var dbClient = await db;

    var response = await dbClient.delete(DBConst.tableCart);
    return response;
  }

  Future<int> cartTotalPrice() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient
        .rawQuery("SELECT SUM(totalprice) FROM ${DBConst.tableCart}"));
  }

  Future<int> cartTotalQuantities() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient
        .rawQuery("SELECT SUM(quantity) FROM ${DBConst.tableCart}"));
  }

  Future<List> getCartCheckoutItems() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery(
        "SELECT ${DBConst.ColumnProdID}, ${DBConst.ColumnProdQty}, ${DBConst.ColumnProdUnitPrice}, ${DBConst.ColumnProdTotalPrice}, ${DBConst.ColumnProdDiscnt} FROM ${DBConst.tableCart}");

    return result.toList();
  }

  //Orders Section
  Future<int> insertRemoteOrders(var orders) async {
    try {
      var dbClient = await db;
      var response = await dbClient.transaction((tranact) async {
        for (var i = 0; i < orders.length; i++) {
          print("Called insert $i: to orders table");

          UserOrder userOrders = new UserOrder();
          userOrders.orderid = orders[i]["orderid"];
          userOrders.userid = orders[i]["userid"];
          userOrders.orderstatid = orders[i]["orderstatid"];
          userOrders.orderrefno = orders[i]["orderrefno"];
          userOrders.totalcost = orders[i]["totalcost"].toDouble();
          userOrders.qty = orders[i]["qty"];
          userOrders.discount = orders[i]["discount"].toDouble();
          userOrders.ispaid = orders[i]['ispaid'] == 1;
          userOrders.created_at = orders[i]['created_at'];
          userOrders.orderdetails = orders[i]['orderdetails'];

          try {
            var qurries =
                'INSERT INTO ${DBConst.tableOrders}(orderid,userid,orderstatid,orderrefno,totalcost,qty,discount,ispaid,orderdetails,created_at) VALUES'
                '(${userOrders.orderid},${userOrders.userid},${userOrders.orderstatid},"${userOrders.orderrefno}",${userOrders.totalcost}, ${userOrders.qty},${userOrders.discount},${userOrders.ispaid ? 1 : 0},"${userOrders.orderdetails}","${userOrders.created_at}")';
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

  Future<int> insertRemoteOrdersDetails(var orders) async {
    try {
      var dbClient = await db;
      var response = await dbClient.transaction((tranact) async {
        for (var i = 0; i < orders.length; i++) {
          print("Called insert $i: to orders_details table");

          UserOrder userOrders = new UserOrder();
          OrderDetailsModel orderDetails = OrderDetailsModel();
          OrderProducts orderProducts = OrderProducts();

//          orderDetails.orderdetailid = orders[i]["orderdetailid"];
//          userOrders.orderid = orders[i]["orderid"];
//          orderProducts.productid = orders[i]['productid'];
//          orderDetails.quantity = orders[i]['quantity'];
//          orderDetails.unitprice = orders[i]['unitprice'];
//          orderDetails.totalprice = orders[i]["totalprice"].toDouble();
//          orderProducts.productname = orders[i]["product"]["productname"];
//          orderProducts.description = orders[i]["product"]["description"];
//          userOrders.created_at = orders[i]['created_at'];

          try {
            var qurries =
                'INSERT INTO ${DBConst.tableOrdersDetails}(orderdetailid,orderid,productid,quantity,unitprice,totalprice,productname,description,created_at) VALUES'
                '(${orderDetails.orderdetailid},${userOrders.orderid},${orderProducts.productid},${orderDetails.quantity}, ${orderDetails.unitprice},${orderDetails.totalprice},"${orderProducts.productname}","${orderProducts.description}","${userOrders.created_at}")';
            var response = await tranact.rawInsert(qurries);
            print(response);
          } catch (exception) {
            print("ERRR ==> ??insert Remote Orders Detils Inner?? <==");
            print("this ihe error: $exception");
          }
        }
        storage.setItem("isFirst", "true");
      });
      return response;
    } catch (exception) {
      print("ERRR ==> ??insert Remote Orders Details?? <==");
      print(exception);
    }
  }

  Future<List> getOrderList() async {
    var dbClient = await db;
    var result =
        await dbClient.rawQuery("SELECT * FROM ${DBConst.tableOrders}");

    return result.toList();
  }

  //get the count of data's in the the DB
  Future<int> getOrderCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM ${DBConst.tableOrders}"));
  }

  getOrderDetails(int id) async {
    var dbClient = await db;

    var result = await dbClient.rawQuery(
        "SELECT * FROM  ${DBConst.tableOrdersDetails} WHERE ${DBConst.ColumnOrderID} = $id");
    if (result.length == 0) return null;

    //gets the firts itm on the table
    return result;
  }

  Future<List> getOrderDetailsList() async {
    var dbClient = await db;
    var result =
        await dbClient.rawQuery("SELECT * FROM ${DBConst.tableOrdersDetails}");

    return result.toList();
  }

  Future<int> getOrderDetialsCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient
        .rawQuery("SELECT COUNT(*) FROM ${DBConst.tableOrdersDetails}"));
  }

  Future<int> clearOrders() async {
    var dbClient = await db;
    var response = await dbClient.delete(DBConst.tableOrders);
    return response;
  }

//  Future<int> clearOrderDetails() async {
//    var dbClient = await db;
//
//    var response = await dbClient.delete(DBConst.tableOrdersDetails);
//    return response;
//  }

  //User Section
//  Future<int> insertUsers(var users) async {
//    try {
//      var dbClient = await db;
//      var response = await dbClient.transaction((tranact) async {
//        for (var i = 0; i < 1; i++) {
//          print("this is the lenght: ${users.length}");
//          print("Called insert $i: to orders table");
//          print('stateid ${users["stateid"]}');
//          print('userid ${users["userid"]}');
//          print('fname ${users["fname"]}');
//          print('lname ${users["lname"]}');
//          print('dob ${users["dob"]}');
//          print('address ${users["address"]}');
//          print('profileimg ${users["profileimg"]}');
//          print('email ${users["email"]}');
//          print('phone ${users["phone"]}');
//          print('created_at ${users["created_at"]}');
//
//          UserModels userDetails = new UserModels();
//          userDetails.stateid = users["stateid"];
//          userDetails.userid = users["userid"];
//          userDetails.fname = users["fname"];
//          userDetails.lname = users["lname"];
//          userDetails.dob = users["dob"];
//          userDetails.address = users["address"];
//          userDetails.profileimg = users["profileimg"];
//          userDetails.email = users['email'];
//          userDetails.phone = users['phone'];
//          userDetails.created_at = users['created_at'];
//          print(userDetails.userid);
//
//          try {
//            var qurries =
//                'INSERT INTO ${DBConst.tableUser}(userid,stateid,fname,lname,dob,address,profileimg,email,phone,created_at) VALUES'
//                '(${userDetails.userid},${userDetails.stateid},"${userDetails.fname}","${userDetails.lname}","${userDetails.dob}", "${userDetails.address}","${userDetails.profileimg}","${userDetails.email}",${userDetails.phone},"${userDetails.created_at}")';
//            var response = await tranact.rawInsert(qurries);
//            print(response);
//          } catch (exception) {
//            print("ERRR ==> ??insertUser inner?? <==");
//            print("this ihe error: $exception");
//          }
//        }
//        storage.setItem("isFirst", "true");
//      });
//      return response;
//    } catch (exception) {
//      print("ERRR ==> ??insertUser <==");
//      print(exception);
//    }
//  }

//  Future<List> getUsers() async {
//    var dbClient = await db;
//    var result = await dbClient.rawQuery("SELECT * FROM ${DBConst.tableUser}");
//
//    return result.toList();
//  }

  updateUserDeatails(int UserId, String firstName, String LastName,
      String address, String dob) async {
    print(
        'This is the fname: $firstName, this is the last name: $LastName , this is the address: $address and this is the dob: $dob');
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
  //CRUD - CREATE, READ, UPDATE, DELETE

//  Future close() async {
//    var dbClient = await db;
//
//    return dbClient.close();
//  }
}
