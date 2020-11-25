import 'package:bulk_buyers/core/error/failures.dart';
import 'package:bulk_buyers/core/usecase/params.dart';
import 'package:bulk_buyers/core/usecase/usecase.dart';
import 'package:bulk_buyers/src/data/models/cart_model.dart';
import 'package:bulk_buyers/src/domain/entities/products_entities.dart';
import 'package:bulk_buyers/src/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class ProductsUC implements UseCase<ProductsEntitiy, Params> {
  final Repository repository;

  ProductsUC(this.repository);
  @override
  Future<Either<Failure, List<ProductsEntitiy>>> call(Params parms) async =>
      throw UnimplementedError();

  @override
  Future<Either<Failure, List<ProductsEntitiy>>> get() async =>
      await repository.fetchProducts();

  @override
  Future<Either<Failure, List<ProductsEntitiy>>> post(Params parm) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductsEntitiy>>> send() {
    // TODO: implement send
    throw UnimplementedError();
  }

  Future<Either<Failure, List<ProductsEntitiy>>> getFilter({int id}) async =>
      await repository.getFilter(id: id);

  updateWishList({int id, bool state}) async =>
      repository.updateWishList(id: id, state: state);

  fetchWishList() async => await repository.fetchWishList();
  addToCart(CartModel model) async => await repository.addToCart(model);
  getProductDetails(int id) async => await repository.getProducts(id);
}
