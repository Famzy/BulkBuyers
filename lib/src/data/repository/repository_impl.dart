import 'package:bulk_buyers/core/error/exceptions.dart';
import 'package:bulk_buyers/core/error/failures.dart';
import 'package:bulk_buyers/core/network/network_info.dart';
import 'package:bulk_buyers/src/data/datasource/local/local_data_source.dart';
import 'package:bulk_buyers/src/data/datasource/remote/remote_data_source.dart';
import 'package:bulk_buyers/src/data/models/login_model.dart';
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
  Future<Either<Failure, List<ProductsEntitiy>>> getProducts(int id) async {
    if (await networkInfo.isConnected) {
    } else {
      throw NetworkException;
    }
  }

  @override
  login(LoginModel loginModel) async {
    if (await networkInfo.isConnected) {
      final response = await remoteData.login(loginModel);
      return response;
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
}
