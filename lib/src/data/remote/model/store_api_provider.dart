import 'dart:convert';

import 'package:bulk_buyers/src/models/discount_models.dart';
import 'package:bulk_buyers/src/models/login_model.dart';
import 'package:bulk_buyers/src/models/place_order_model.dart';
import 'package:bulk_buyers/src/models/user_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:async';
import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  /*
  /// Project Bulk Buyers
  /// Class Name [ApiProvider]
  /// Description : Function this class is meant to handle all basic API calls \ eliminating
  /// making Calls on the Main UI Thread.
  /// Author:  Eric Lekwa
  /// Created : [9:4:20  21:50]
  /// Last Upadted : [19:4:20 23:43]
  *
  * */

  //Implementation of Singleton
  static final ApiProvider _instance = new ApiProvider.internal();
  factory ApiProvider() => _instance;
  ApiProvider.internal();

  final _root = Constants.BASE_URL;
  Client client = Client();


//  // Auth Section
//  Future<int> registration(Register register) async {
//    print("Resgister call made");
//    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//    var registerFileds = register.toJson();
//    try {
//      var response = await client.post('$_root/s',
//          headers: {
//            "key": "Content-Type",
//            "value": "application/json",
//          },
//          body: registerFileds);
//      if (response.statusCode == 200) {
//        var token = json.decode(response.body);
//        sharedPreferences.setString("token", token['token']);
//      }
//      print(response.body);
//      return response.statusCode;
//    } on Exception catch (e) {
//      print(e);
//    }
//  }

//  Future<int> login(Login login) async {
//    print("loggining triggred");
//    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//
//    var loginFields = login.toJson();
//    try {
//      print(loginFields);
//      var response = await client.post('$_root/access',
//          headers: {
//            "key": "Content-Type",
//            "value": "application/json",
//          },
//          body: loginFields);
//      print(response.statusCode);
//      print(response.body);
//      if (response.statusCode == 200) {
//        var token = json.decode(response.body);
//        sharedPreferences.setString("token", token['token']);
//        sharedPreferences.setString("state", "false");
//      }
//      print(response.body);
//      return response.statusCode;
//    } catch (exception) {
//      print(exception);
//    }
//  }

  Future<List<List>> fetchUserDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");

    final response = await client.get("$_root/user", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });
    var data = json.decode(response.body);

    return data.cast<List>();
  }

  Future<int> passwordReset(Login login) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var loginFields = login.toJson();
    try {
      var response = await client.post('$_root/access',
          headers: {
            "key": "Content-Type",
            "value": "application/json",
          },
          body: loginFields);
      if (response.statusCode == 200) {
        var token = json.decode(response.body);
        sharedPreferences.setString("token", token['token']);
      }
      print(response.body);
      return response.statusCode;
    } catch (exception) {
      print(exception);
    }
  }

  //Store Section
  fetchProducts() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");

    final response = await client.get("$_root/product/list", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });
    var data = json.decode(response.body);
    return data;
  }

  fetchProductDetail(int id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");

    final response = await client.get("$_root/detail/$id", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });
    var data = json.decode(response.body);

    return data;
  }

  Future<List<List>> fetchCategories() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");

    final response = await client.get("$_root/category/list", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });
    List data = json.decode(response.body);

    return data.cast<List>();
  }

  // Orders
  Future<int> postOrders(PostOrders ordersPosted) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");

    var orderFields = ordersPosted.toJson();
    var orderData = json.encode(orderFields);

    print(orderData);
    final response = await client.post("$_root/order/add",
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
        body: orderData);
    print("This is the status Code: ${response.statusCode}");
    print("This is the msg Code: ${response.body}");
    return response.statusCode;
  }

  fetchOrderList() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    final response = await client.get("$_root/order/list", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });
    var order = json.decode(response.body);
    return order;
  }

  fetchOrderDetails(int id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    final response = await client.get("$_root/order/details/$id", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"

    });
    var order = json.decode(response.body);
    return order;
  }
   fetchUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    final response = await client.get("$_root/user", headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    });
    var user = json.decode(response.body);
    print(response.body);
    return user;
  }
  Future<int> updateProfile(User user) async {
    print("Update call made");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");
    var updateFileds = user.toJson();
    print(updateFileds);
    try {
      var response = await client.post('$_root/user/edit',
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token"
          },
          body: updateFileds);
      print(response.body);
      return response.statusCode;
    } on Exception catch (e) {
      print(e);
    }
  }

//  Future<dynamic> getDiscount(Discount discount) async {
//    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//    String token = sharedPreferences.getString("token");
//
//    var body = discount.toJson();
//    print('discount code: $body');
//    final response = await client.post("$_root/discount/code",
//        headers: {
//          "Accept": "application/json",
//          "Authorization": "Bearer $token",
//          "Content-Type": "application/json"
//        },
//        body: body);
//    print("This is the status Code: ${response.statusCode}");
//    print("This is the msg Code: ${response.body}");
//    return response;
//  }
}
