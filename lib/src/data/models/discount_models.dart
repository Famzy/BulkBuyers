import 'package:bulk_buyers/src/domain/entities/discount_entity.dart';
import 'package:meta/meta.dart';

class DiscountModel extends DiscountEnitiy {
  DiscountModel({
    @required code,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> discountCode = new Map<String, dynamic>();

    discountCode['code'] = code;

    return discountCode;
  }
}
