import 'package:bulk_buyers/core/utils/bulk_buyers_strings.dart';

class BCExeptions implements Exception {
  String message;
  BCExeptions(this.message);
  @override
  String toString() {
    if (message == null) return BCStrings.unKnownError;
    return message;
  }
}

class ServerException extends BCExeptions {
  ServerException(String message) : super(message);
}

class CacheException extends BCExeptions {
  CacheException(String message) : super(message);
}

class NetworkException extends BCExeptions {
  NetworkException(String message) : super(message);
}
