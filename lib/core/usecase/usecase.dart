import 'package:bulk_buyers/core/error/failures.dart';

import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Parms> {
  Future<Either<Failure, List<Type>>> call(Parms parms);
  Future<Either<Failure, List<Type>>> get();
  Future<Either<Failure, List<Type>>> post(Parms parm);
  Future<Either<Failure, List<Type>>> send();
}
