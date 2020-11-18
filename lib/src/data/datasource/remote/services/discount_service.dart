import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/src/data/datasource/constants/data_constants.dart';
import 'package:bulk_buyers/src/data/models/discount_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

HttpClient dicountClient = new HttpClient();

class DiscountService with EndPoints {
  static final DiscountService _instance = new DiscountService.internal();
  factory DiscountService() => _instance;
  DiscountService.internal();

  Future<dynamic> getDiscount(DiscountModel discounts) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    var body = discounts.toJson();
    print('discount code: $body');
    dicountClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    String url = discount;

    HttpClientRequest request = await dicountClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.headers.set('authorization', 'Bearer $token');
    HttpClientResponse response = await request.close();
    int status = await response.statusCode;

    var res = await response.transform(utf8.decoder).join();
    var value = json.decode(res);

    print(status);
    print(value);
    return value;
  }
}
