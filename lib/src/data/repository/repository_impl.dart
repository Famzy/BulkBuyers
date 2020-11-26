import 'package:bulk_buyers/core/error/exceptions.dart';
import 'package:bulk_buyers/core/error/failures.dart';
import 'package:bulk_buyers/core/network/network_info.dart';
import 'package:bulk_buyers/core/utils/bulk_buyers_strings.dart';
import 'package:bulk_buyers/src/data/datasource/local/local_data_source.dart';
import 'package:bulk_buyers/src/data/datasource/remote/remote_data_source.dart';
import 'package:bulk_buyers/src/data/models/cart_model.dart';
import 'package:bulk_buyers/src/data/models/login_model.dart';
import 'package:bulk_buyers/src/data/models/products_model.dart';
import 'package:bulk_buyers/src/data/models/registration_model.dart';
import 'package:bulk_buyers/src/domain/entities/categories_entities.dart';
import 'package:bulk_buyers/src/domain/entities/products_entities.dart';
import 'package:bulk_buyers/src/domain/entities/registration_entity.dart';
import 'package:bulk_buyers/src/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

class RepositoryImpl implements Repository {
  final NetworkInfo networkInfo;
  final RemoteData remoteData;
  final LocalData localData;
  final SharedPreferences sharedPreferences;

  RepositoryImpl(
      {@required this.networkInfo,
      @required this.remoteData,
      @required this.localData,
      @required this.sharedPreferences});
  @override
  Future<Either<Failure, List<ProductsEntitiy>>> fetchProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteData.fetchProducts();
        localData.insertRemoteProducts(products: remoteProducts);
        return Right(remoteProducts);
      } catch (e) {
        print(e);
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductsEntitiy>>> fetchCachedProducts() async {}

  @override
  Future<List> fetchUser() async {
    if (await networkInfo.isConnected) {
    } else {
      throw NetworkException;
    }
  }

  @override
  Future<List> fetchUserOrders() async {
    if (await networkInfo.isConnected) {
    } else {
      throw NetworkException;
    }
  }

  @override
  Future<Either<Failure, List<CategoriesEntities>>> getCategories() async {
    if (await networkInfo.isConnected) {
      try {
        print("Oya");
        final categories = await remoteData.fetchCategories();
        print("CAT REPO $categories");
        return Right(categories);
      } catch (e, s) {
        print(s);
        return Left(ServerFailure());
      }
    } else {
      try {} catch (e, s) {
        return Left(NetworkFailure());
      }
    }
  }

  @override
  getOrderDetails(int id) async {
    if (await networkInfo.isConnected) {
    } else {
      throw NetworkException;
    }
  }

  @override
  Future<ProductsModels> getProducts(int id) async {
    try {
      final product = await localData.getProduct(id: id);
      return product;
    } catch (e, s) {
      print(s);
    }
  }

  @override
  login(LoginModel loginModel) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteData.login(loginModel);
        print(response);
        await localData.cacheToken(token: response);
        await localData.cacheState(state: BCStrings.IS_VERIFIED);
        return "Authenticated";
      } catch (e) {
        throw e;
      }
    } else {
      throw NetworkException;
    }
  }

  @override
  Future<int> logout() {
    sharedPreferences.clear();
    sharedPreferences.commit();
  }

  @override
  Future<Either<Failure, List<ProductsEntitiy>>> refreshProducts() async {
    if (await networkInfo.isConnected) {
    } else {
      throw NetworkException;
    }
  }

  @override
  discount() {
    // TODO: implement discount
    throw UnimplementedError();
  }

  @override
  reset(ResetModel reset) async {
    if (await networkInfo.isConnected) {
      try {
        final response = remoteData.reset(reset);
        return response;
      } catch (e) {
        throw ServerException(e);
        print(e);
      }
    } else
      throw NetworkException;
  }

  @override
  signup(RegisterModel registerModel) async {
    if (await networkInfo.isConnected) {
      remoteData.register(registerModel);
    } else {
      throw NetworkException;
    }
  }

  @override
  Future<int> getProCount() async {
    return await localData.getProCount();
  }

  @override
  Future<Either<Failure, List<ProductsEntitiy>>> getFilter({int id}) async =>
      await localData.filterProducts(id: id);

  @override
  updateWishList({int id, bool state}) async =>
      localData.addToWishList(productid: id, wishlist: state);

  @override
  fetchWishList() async => await localData.getWishLists();

  @override
  addToCart(List<CartModel> model) async =>
      await localData.addToCart(cart: model);

  @override
  Future<int> CartTotal() {
    // TODO: implement CartTotal
    throw UnimplementedError();
  }

  @override
  Future<int> cartTotalQuantities() {
    // TODO: implement cartTotalQuantities
    throw UnimplementedError();
  }

  @override
  clearCart() async => await localData.clearCartDB();

  @override
  Future<List> getCartCheckoutItems() {
    // TODO: implement getCartCheckoutItems
    throw UnimplementedError();
  }

  @override
  Future<int> getCartCount() async => localData.getCartCount();

  @override
  Future<List<CartModel>> getCartList() async => localData.getCartList();

  @override
  removeFromCart(int id) {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }

  @override
  updateCartItems() {
    // TODO: implement updateCartItems
    throw UnimplementedError();
  }
}
