import 'package:bulk_buyers/core/error/failures.dart';
import 'package:bulk_buyers/core/usecase/params.dart';
import 'package:bulk_buyers/core/usecase/usecase.dart';
import 'package:bulk_buyers/src/domain/entities/user_entities.dart';
import 'package:bulk_buyers/src/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class UserUC implements UseCase<UserEntities, Params> {
  final Repository repository;

  UserUC(this.repository);
  @override
  Future<Either<Failure, List<UserEntities>>> call(Params parms) {
    // TODO: implement call
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<UserEntities>>> get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<UserEntities>>> post(Params parm) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<UserEntities>>> send() {
    // TODO: implement send
    throw UnimplementedError();
  }
}
