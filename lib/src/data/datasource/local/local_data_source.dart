import 'package:bulk_buyers/src/data/models/cart_model.dart';
import 'package:bulk_buyers/src/data/models/products_model.dart';
import 'package:bulk_buyers/src/data/models/user_model.dart';
import 'package:meta/meta.dart';

abstract class LocalData {
  ///
  ///   Project Bulk Buyers
  ///  Class Name [SqfLiteDatabaseHelper]
  ///  Description : Function this class is meant to handle all basic CURD functions eliminating
  ///  making CURD on the Main UI Thread.
  ///  Author:  Eric Lekwa
  ///  Created : [9:4:20  12:50]
  ///  Last Upadted : [23:10:20  14:58]
  ///
  ///
  ///
  initDB();
  Future<List> getCartList();
  Future<int> getCartCount();
  Future<int> deleteCartItems({@required int id});
  Future<int> insertRemoteProducts({@required List products});
  Future<List> getAllProducts();
  Future<ProductsModels> getProduct({@required int id});
  Future<int> deleteProduct({@required int id});
  Future<int> clearStoreDB();
  Future<int> clearProducts();
  addToWishList({@required int productid, @required bool wishlist});
  Future<List> getWishLists();
  Future<int> addToCart({@required CartModel shopItems});
  updateCartPriceAndQty(
      {@required int productid, @required int price, @required int qty});
  Future<int> clearCartDB();
  Future<int> cartTotalPrice();
  Future<int> cartTotalQuantities();
  Future<List> getCartCheckoutItems();
  Future<int> insertRemoteOrders({@required var orders});
  Future<int> insertRemoteOrdersDetails({@required var orders});
  Future<List> getOrderList();
  Future<int> getOrderCount();
  getOrderDetails({@required int id});
  Future<List> getOrderDetailsList();
  Future<int> getOrderDetialsCount();
  Future<int> clearOrders();
  Future<int> clearOrderDetails();
  Future<int> insertUsers({@required UserModels users});
  Future<List> getUsers();
  updateUserDeatails(
      {@required int UserId,
      @required String firstName,
      @required String LastName,
      @required String address,
      @required String dob});
  Future close();
}
