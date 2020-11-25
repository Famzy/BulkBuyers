import 'package:bulk_buyers/core/error/failures.dart';
import 'package:bulk_buyers/src/data/models/cart_model.dart';
import 'package:bulk_buyers/src/data/models/order_details_model.dart';
import 'package:bulk_buyers/src/data/models/products_model.dart';
import 'package:bulk_buyers/src/data/models/user_model.dart';
import 'package:bulk_buyers/src/domain/entities/products_entities.dart';
import 'package:dartz/dartz.dart';
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
  Future<int> insertRemoteProducts({@required List<ProductsModels> products});
  Future<List<ProductsEntitiy>> getAllProducts();
  Future<Either<Failure, List<ProductsEntitiy>>> filterProducts(
      {@required int id});
  Future<ProductsModels> getProduct({@required int id});
  Future<int> deleteProduct({@required int id});
  Future<int> clearStoreDB();
  Future<int> clearProducts();
  addToWishList({@required int productid, @required bool wishlist});
  Future<List> getWishLists();
  Future<int> addToCart({@required CartModel cartItems});
  updateCartPriceAndQty(
      {@required int productid, @required int price, @required int qty});
  Future<int> clearCartDB();
  Future<int> cartTotalPrice();
  Future<int> cartTotalQuantities();
  Future<List> getCartCheckoutItems();
  Future<int> insertRemoteOrders({@required List<OrdersModel> orders});
  Future<int> insertRemoteOrdersDetails({@required OrderDetailsModel orders});
  Future<List> getOrderList();
  Future<int> getOrderCount();
  Future<int> getProCount();
  getOrderDetails({@required int id});
  Future<List> getOrderDetailsList();
  Future<int> getOrderDetialsCount();
  Future<int> clearOrders();
  Future<int> clearOrderDetails();
  Future<int> insertUsers({@required UserModels users});
  Future<List> getUsers();
  Future<String> getToken();
  Future<void> cacheToken({@required String token});
  Future<void> cacheState({@required String state});
  updateUserDeatails(
      {@required int UserId,
      @required String firstName,
      @required String LastName,
      @required String address,
      @required String dob});
  Future close();
}
