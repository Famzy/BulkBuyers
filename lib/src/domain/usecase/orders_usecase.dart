import 'package:bulk_buyers/core/error/failures.dart';
import 'package:bulk_buyers/core/usecase/params.dart';
import 'package:bulk_buyers/core/usecase/usecase.dart';
import 'package:bulk_buyers/src/domain/entities/order_details_entity.dart';
import 'package:bulk_buyers/src/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class OrdersUC implements UseCase<OrdersEnitiy, Params> {
  final Repository repository;

  OrdersUC(this.repository);
  @override
  Future<Either<Failure, List<OrdersEnitiy>>> call(Params parms) {
    // TODO: implement call
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<OrdersEnitiy>>> get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<OrdersEnitiy>>> post(Params parm) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<OrdersEnitiy>>> send() {
    // TODO: implement send
    throw UnimplementedError();
  }
}
