import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/src/data/datasource/constants/data_constants.dart';
import 'package:bulk_buyers/src/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApiService with EndPoints {
  final HttpClient client = new HttpClient();

  Future<String> login(LoginModel login) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var loginFields = login.toJson();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await client.postUrl(Uri.parse(auth));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(loginFields)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    print(reply);
  }
}
