import 'package:bulk_buyers/core/error/failures.dart';
import 'package:bulk_buyers/src/data/models/cart_model.dart';
import 'package:bulk_buyers/src/data/models/login_model.dart';
import 'package:bulk_buyers/src/data/models/products_model.dart';
import 'package:bulk_buyers/src/data/models/registration_model.dart';
import 'package:bulk_buyers/src/domain/entities/categories_entities.dart';
import 'package:bulk_buyers/src/domain/entities/products_entities.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  login(LoginModel loginModel);
  signup(RegisterModel registerModel);
  reset(ResetModel reset);
  discount();
  Future<Either<Failure, List<ProductsEntitiy>>> fetchProducts();
  Future<Either<Failure, List<ProductsEntitiy>>> fetchCachedProducts();
  Future<Either<Failure, List<ProductsEntitiy>>> refreshProducts();
  Future<ProductsModels> getProducts(int id);
  addToCart(CartModel model);
  Future<int> CartTotal();
  Future<int> cartTotalQuantities();
  clearCart();
  removeFromCart(int id);
  updateCartItems();
  Future<List> getCartList();
  Future<int> getCartCount();
  Future<List> getCartCheckoutItems();
  Future<Either<Failure, List<ProductsEntitiy>>> getFilter({int id});
  Future<List> fetchUserOrders();
  getOrderDetails(int id);
  Future<List> fetchUser();
  Future<int> logout();
  Future<int> getProCount();
  fetchWishList();
  updateWishList({int id, bool state});
  Future<Either<Failure, List<CategoriesEntities>>> getCategories();
}
