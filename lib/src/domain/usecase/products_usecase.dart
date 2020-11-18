import 'package:bulk_buyers/core/error/failures.dart';
import 'package:bulk_buyers/core/usecase/params.dart';
import 'package:bulk_buyers/core/usecase/usecase.dart';
import 'package:bulk_buyers/src/domain/entities/products_entities.dart';
import 'package:bulk_buyers/src/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class ProductsUC implements UseCase<ProductsEntitiy, Params> {
  final Repository repository;

  ProductsUC(this.repository);
  @override
  Future<Either<Failure, List<ProductsEntitiy>>> call(Params parms) async =>
      await repository.getProducts(parms.prodcatid);

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
}
