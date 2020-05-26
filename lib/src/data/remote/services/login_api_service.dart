import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/src/models/login_model.dart';
import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiService  {
  final HttpClient client = new HttpClient();
  final _root = Constants.BASE_URL;
  Future <String>login(Login login) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var loginFields = login.toJson();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
String url ="$_root/access";
    HttpClientRequest request = await client.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(loginFields)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    print(reply);
  }
}
