import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

HttpClient clientUser = new HttpClient();
final _root = Constants.BASE_URL;

class UserService {
  static final UserService _instance = new UserService.internal();
  factory UserService() => _instance;
  UserService.internal();

  fetchUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    clientUser.badCertificateCallback =
    ((X509Certificate cert, String host, int port) => true);
    String url = "$_root/user";

    HttpClientRequest request = await clientUser.getUrl(Uri.parse(url));
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
