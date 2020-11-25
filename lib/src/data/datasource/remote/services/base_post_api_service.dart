import 'dart:io';

import 'package:bulk_buyers/core/utils/bulk_buyers_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasePostService {
  final Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
    HttpHeaders.acceptHeader: 'application/json',
  };
}

Future<Map<String, String>> authHeader() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String token = sharedPreferences.getString(BCStrings.CACHE_TOKEN);
  final Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
    HttpHeaders.acceptHeader: 'application/json',
    HttpHeaders.authorizationHeader: "Bearer $token"
  };
  return headers;
}
