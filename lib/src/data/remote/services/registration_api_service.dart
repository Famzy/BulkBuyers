import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/src/models/registration_model.dart';
import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'base_post_api_service.dart';


class RegistrationApiService extends BasePostService {
  final HttpClient client = new HttpClient();
  final _root = Constants.BASE_URL;
  register(Register register) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var loginFields = register.toJson();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    String url = "$_root/access";
    HttpClientRequest request = await client.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(loginFields)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    print(reply);
  }
}
