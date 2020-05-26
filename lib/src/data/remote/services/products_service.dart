import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

HttpClient client = new HttpClient();
final _root = Constants.BASE_URL;

class ProductService {
  static final ProductService _instance = new ProductService.internal();
  factory ProductService() => _instance;
  ProductService.internal();

  fetchProducts() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    client.badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);
    String url = "$_root/product/list";

    HttpClientRequest request = await client.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.headers.set('authorization', 'Bearer $token');
    HttpClientResponse response = await request.close();
    int status = await response.statusCode;
    var res = await response.transform(utf8.decoder).join();
    var products = json.decode(res);
    print(status);
    print(products);
    return products;
  }
}
