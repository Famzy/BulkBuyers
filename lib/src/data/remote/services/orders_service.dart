import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

HttpClient orderClient = new HttpClient();
final _root = Constants.BASE_URL;

class OrdersService {
  static final OrdersService _instance = new OrdersService.internal();
  factory OrdersService() => _instance;
  OrdersService.internal();

  fetchOrderList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    orderClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    String url = "$_root/order/list";

    HttpClientRequest request = await orderClient.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.headers.set('authorization', 'Bearer $token');
    HttpClientResponse response = await request.close();
    int status = await response.statusCode;
    var res = await response.transform(utf8.decoder).join();
    var order = json.decode(res);
    print(status);
    print(order);
    return order;
  }

  fetchOrderDetails(int id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    orderClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    String url = "$_root/order/details/$id";

    HttpClientRequest request = await orderClient.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.headers.set('authorization', 'Bearer $token');
    HttpClientResponse response = await request.close();
    int status = await response.statusCode;
    var res = await response.transform(utf8.decoder).join();
    var orderDetails = json.decode(res);
    print(status);
    print(orderDetails);
    return orderDetails;
  }
}
