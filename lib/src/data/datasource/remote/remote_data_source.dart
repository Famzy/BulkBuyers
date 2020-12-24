import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/core/error/exceptions.dart';
import 'package:bulk_buyers/core/error/failures.dart';
import 'package:bulk_buyers/src/data/datasource/constants/data_constants.dart';
import 'package:bulk_buyers/src/data/datasource/remote/services/base_post_api_service.dart';
import 'package:bulk_buyers/src/data/models/categories_model.dart';
import 'package:bulk_buyers/src/data/models/login_model.dart';
import 'package:bulk_buyers/src/data/models/products_model.dart';
import 'package:bulk_buyers/src/data/models/registration_model.dart';
import 'package:bulk_buyers/src/data/models/user_model.dart';
import 'package:bulk_buyers/src/domain/entities/categories_entities.dart';
import 'package:bulk_buyers/src/domain/entities/products_entities.dart';
import 'package:http/http.dart' show Client;
import 'package:meta/meta.dart';

abstract class RemoteData {
  login(LoginModel loginModel);
  register(RegisterModel registerModel);
  reset(ResetModel resetModel);
  getUserDetails();
  Future<List<CategoriesEntities>> fetchCategories();
  Future<List<ProductsEntitiy>> fetchProducts();
}

class RemoteDataImpl with EndPoints implements RemoteData {
  Client client = Client();
  final HttpClient httpClient = new HttpClient();

  RemoteDataImpl({@required this.client});

  @override
  login(LoginModel loginModel) async {
    final body = loginModel.toJson();
    print(body);
    try {
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(auth));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(body)));

      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      final data = json.decode(reply);
      final token = data['token'];
      int status = await response.statusCode;
      print(status);
      switch (status) {
        case HttpStatus.ok:
          return token;
        case HttpStatus.unauthorized:
          throw ServerException("UnAuthorised");
        default:
          throw ServerFailure();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<CategoriesEntities>> fetchCategories() async {
    print("hit");
    print("CAT DS $categories");
    final Map<String, String> head = await authHeader();
    try {
      final response = await client.get(categories, headers: head);
      print(response.body);
      var data = json.decode(response.body);
      Iterable list = data;
//      print(list.length);

      switch (response.statusCode) {
        case HttpStatus.ok:
          print(" this is the data of Cat: $data");
//          return CategoriesModel.formJson(data);
          return list.map((model) => CategoriesModel.formJson(model)).toList();
        default:
          throw ServerFailure();
      }
    } catch (e) {
      print("this is the error $e");
    }
  }

  @override
  Future<List<ProductsEntitiy>> fetchProducts() async {
    final Map<String, String> head = await authHeader();
    try {
      final response = await client.get(product, headers: head);
      Iterable data = json.decode(response.body);

      switch (response.statusCode) {
        case HttpStatus.ok:
          return data.map((model) => ProductsModels.formJson(model)).toList();
        default:
          throw ServerFailure();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  register(RegisterModel registerModel) async {
    final body = registerModel.toJson();
    try {
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(signup));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(body)));

      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      int status = await response.statusCode;
      switch (status) {
        case HttpStatus.ok:
          return reply;
        case HttpStatus.unauthorized:
          throw ServerException(reply);
        default:
          throw ServerFailure();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  reset(ResetModel resetModel) async {
    final body = resetModel.toJson();
    try {
      httpClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      HttpClientRequest request =
          await httpClient.postUrl(Uri.parse(forgotPassword));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(body)));

      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      int status = await response.statusCode;
      print(status);
      switch (status) {
        case HttpStatus.ok:
          return reply;
        case HttpStatus.unauthorized:
          throw ServerException("UnAuthorised");
        default:
          throw ServerFailure();
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  getUserDetails() async {
    final Map<String, String> head = await authHeader();
    try {
      final response = await client.get(users, headers: head);
      final data = json.decode(response.body);

      switch (response.statusCode) {
        case HttpStatus.ok:
          return UserModels.fromJson(data);
        default:
          throw ServerFailure();
      }
    } catch (e) {
      print(e);
    }
  }
}
