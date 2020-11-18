import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/core/utils/constants.dart';
import 'package:bulk_buyers/src/data/datasource/constants/data_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

HttpClient client = new HttpClient();

class ProductService with EndPoints {
  static final ProductService _instance = new ProductService.internal();
  factory ProductService() => _instance;
  ProductService.internal();

  fetchProducts() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await client.getUrl(Uri.parse(product));
    request.headers.set('content-type', 'application/json');
    request.headers.set('authorization', 'Bearer $token');
    HttpClientResponse response = await request.close();
    int status = await response.statusCode;
    var res = await response.transform(utf8.decoder).join();
    var products = json.decode(res);
    print(status);
    // print(products);
    return products;
  }
}
