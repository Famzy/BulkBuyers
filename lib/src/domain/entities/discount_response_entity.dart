import 'package:equatable/equatable.dart';

class DiscountResponseEntity extends Equatable {
  final int discountid;
  final int percent;

  DiscountResponseEntity({this.discountid, this.percent})
      : super([discountid, percent]);
}
