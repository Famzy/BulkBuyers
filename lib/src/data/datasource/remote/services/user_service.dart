import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/core/utils/constants.dart';
import 'package:bulk_buyers/src/data/datasource/constants/data_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

HttpClient clientUser = new HttpClient();

class UserService with EndPoints {
  static final UserService _instance = new UserService.internal();
  factory UserService() => _instance;
  UserService.internal();

  fetchUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    clientUser.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await clientUser.getUrl(Uri.parse(users));
    request.headers.set('content-type', 'application/json');
    request.headers.set('authorization', 'Bearer $token');
    HttpClientResponse response = await request.close();
    int status = await response.statusCode;
    var res = await response.transform(utf8.decoder).join();
    var user = json.decode(res);
    print(status);
    print(user);
    return user;
  }
}
