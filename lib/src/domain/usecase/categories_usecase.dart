import 'package:bulk_buyers/core/error/failures.dart';
import 'package:bulk_buyers/core/usecase/params.dart';
import 'package:bulk_buyers/core/usecase/usecase.dart';
import 'package:bulk_buyers/src/domain/entities/categories_entities.dart';
import 'package:bulk_buyers/src/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class CategoriesUC implements UseCase<CategoriesEntities, NoParams> {
  final Repository repository;

  CategoriesUC(this.repository);
  @override
  Future<Either<Failure, List<CategoriesEntities>>> call(NoParams none) async =>
      throw UnimplementedError();

  @override
  Future<Either<Failure, List<CategoriesEntities>>> get() async =>
      await repository.getCategories();

  @override
  Future<Either<Failure, List<CategoriesEntities>>> post(NoParams parm) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CategoriesEntities>>> send() {
    // TODO: implement send
    throw UnimplementedError();
  }

  getOunt() async => await repository.getProCount();
}
