import 'package:bulk_buyers/core/error/failures.dart';

class InputConverter {
  Future<int> stringToUnsignedInteger(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw FormatException();
      integer;
    } on FormatException {
      throw InvalidInputFailure();
    }
  }
}

class InvalidInputFailure extends Failure {}
