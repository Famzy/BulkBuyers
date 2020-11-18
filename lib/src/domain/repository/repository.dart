import 'package:bulk_buyers/core/error/failures.dart';
import 'package:bulk_buyers/src/data/models/login_model.dart';
import 'package:bulk_buyers/src/data/models/registration_model.dart';
import 'package:bulk_buyers/src/domain/entities/categories_entities.dart';
import 'package:bulk_buyers/src/domain/entities/products_entities.dart';
import 'package:bulk_buyers/src/domain/entities/registration_entity.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  login(LoginModel loginModel);
  signup(RegisterModel registerModel);
  reset(ResetModel reset);
  discount();
  Future<Either<Failure, List<ProductsEntitiy>>> fetchProducts();
  Future<Either<Failure, List<ProductsEntitiy>>> fetchCachedProducts();
  Future<Either<Failure, List<ProductsEntitiy>>> refreshProducts();
  Future<Either<Failure, List<ProductsEntitiy>>> getProducts(int id);
  Future<List> fetchUserOrders();
  getOrderDetails(int id);
  Future<List> fetchUser();
  Future<int> logout();
  Future<Either<Failure, List<CategoriesEntities>>> getCategories();
}
