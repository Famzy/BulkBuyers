import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/src/models/discount_models.dart';
import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

HttpClient dicountClient = new HttpClient();
final _root = Constants.BASE_URL;

class DiscountService {
  static final DiscountService _instance = new DiscountService.internal();
  factory DiscountService() => _instance;
  DiscountService.internal();

  Future<dynamic> getDiscount(Discount discount) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    var body = discount.toJson();
    print('discount code: $body');
    dicountClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    String url = "$_root/discount/code";

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
