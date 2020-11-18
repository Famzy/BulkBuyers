import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/src/data/datasource/constants/data_constants.dart';
import 'package:bulk_buyers/src/data/models/registration_model.dart';
import 'package:bulk_buyers/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_post_api_service.dart';

class RegistrationApiService extends BasePostService with EndPoints {
  final HttpClient client = new HttpClient();

  register(RegisterModel register) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var loginFields = register.toJson();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    HttpClientRequest request = await client.postUrl(Uri.parse(signup));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(loginFields)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    print(reply);
  }
}
