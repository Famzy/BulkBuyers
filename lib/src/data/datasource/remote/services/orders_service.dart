import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/src/data/datasource/constants/data_constants.dart';
import 'package:bulk_buyers/src/data/models/place_order_model.dart';
import 'package:bulk_buyers/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

HttpClient orderClient = new HttpClient();

class OrdersService with EndPoints {
  static final OrdersService _instance = new OrdersService.internal();
  factory OrdersService() => _instance;
  OrdersService.internal();

  fetchOrderList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    orderClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await orderClient.getUrl(Uri.parse(orderList));
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
    String url = "$orderDetail/$id";

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

  // Orders
  postOrders(PostOrders ordersPosted) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");

    orderClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    String url = "$postOrder/o";

    HttpClientRequest request = await orderClient.postUrl(Uri.parse(postOrder));
    request.headers.set('content-type', 'application/json');
    request.headers.set('authorization', 'Bearer $token');

    var orderFields = ordersPosted.toJson();
    var orderData = json.encode(orderFields);
    request.add(utf8.encode(json.encode(orderFields)));
    print(orderData);
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();

    var orderResponse = json.decode(reply);

    print("This is the status Code: ${response.statusCode}");
    print("This is the msg Code: $orderResponse");
    return orderResponse;
  }

  paidOrders(PayOrders payOrders) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");

    orderClient.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await orderClient.postUrl(Uri.parse(paidOrder));
    request.headers.set('content-type', 'application/json');
    request.headers.set('authorization', 'Bearer $token');

    var payFields = payOrders.toJson();
    var payData = json.encode(payFields);
    request.add(utf8.encode(json.encode(payFields)));

    HttpClientResponse response = await request.close();
    String result = await response.transform(utf8.decoder).join();

    var paymentResponse = json.decode(result);

    print("This is the status Code: ${response.statusCode}");
    print("This is the msg Code: $paymentResponse");

    return paymentResponse;
  }
}
