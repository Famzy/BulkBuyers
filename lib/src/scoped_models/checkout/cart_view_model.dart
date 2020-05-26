import 'package:bulk_buyers/src/data/local/database_helper.dart';
import 'package:bulk_buyers/src/data/remote/model/store_api_provider.dart';
import 'package:bulk_buyers/src/models/cart_model.dart';
import 'package:bulk_buyers/src/models/cart_items.dart';
import 'package:bulk_buyers/service_locator.dart';
import 'package:bulk_buyers/src/models/discount_models.dart';
import 'package:bulk_buyers/src/services/storage_service.dart';
import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' show post;

import '../base_model.dart';

export 'package:bulk_buyers/src/enums/view_state.dart';

/// Contains logic for a list view with the general expected functionality.
class CartViewModel extends BaseModel {
  StorageService storageService = locator<StorageService>();
  List<CartItems> cartData;
  List _cart = [];
  bool isSuccessful = true;
  String cartMsg = "";
  String subtotal;
  int total;
  String discountMsg = "";

  final _root = Constants.BASE_URL;
  var api = ApiProvider();
  var db = new DatabaseHelper();

  Future fetchCartData() async {
    setState(ViewState.Busy);

    _cart = await db.getCartList();
    for (int i = 0; i < _cart.length; i++) {
      // Cart cart = Cart.map(_cart[i]);
    }
    await Future.delayed(Duration(seconds: 0));

    _cart = List<CartItems>.generate(
        _cart.length,
        (index) => CartItems(
            productname: _cart[index]['productname'],
            totalprice: _cart[index]['totalprice'],
            productimg: _cart[index]['productimg'],
            quantity: _cart[index]['quantity'],
            productid: _cart[index]['productid'],
            cartid: _cart[index]['cartid'],
            unitprice: _cart[index]['unitprice']));

    if (_cart == null) {
      setState(ViewState.Error);
    } else {
      setState(_cart.length == 0
          ? ViewState.NoDataAvailable
          : ViewState.DataFetched);
    }
    this.sum();
    notifyListeners();
  }

  void addToCart(int id, String name, int price, int quantity, String image,
      int unitprice, int totalprice, int discount) async {
    _cart = await db.getCartList();

    int _index = _cart.indexWhere((item) => item['productid'] == id);
    if (_index > -1) {
      isSuccessful = false;
      cartMsg = "${name.toUpperCase()} already in Cart .";
      print(cartMsg);
    } else {
      var db = DatabaseHelper();

      var response = await db.addToCart(
          Cart(id, name, price, quantity, unitprice, image, discount));
      isSuccessful = true;
      cartMsg = "${name.toUpperCase()} was successfully added to Cart .";
      print('This is the DB Insert Cart Response: $response');
    }
    notifyListeners();

    print(
        'id: $id, name: $name, price: $price, Qty: $quantity, img: $image, unit price: $unitprice');
  }

  sum() async {
    var sumation = await db.cartTotalPrice();
    notifyListeners();
    subtotal = sumation.toString();
    var discount = sumation / 100 * 5;
    total = sumation - discount.hashCode ;
  }

  updateCartPrice(int productid, int price, int quantity) async {
    var response = db.updateCartPriceAndQty(productid, price, quantity);
    notifyListeners();
    print(response);

    List cart = await db.getCartList();
    print('this is itens : ${cart.toString()}');
    this.sum();
    this.fetchCartData();
    notifyListeners();
  }

  removeFromCart(Cart cart, int id) async {
    print("This is the ID: $id passed for delete");
  }

  getDiscount(String discountCode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");

    Map body = {"code": discountCode};

    try {
      var response = await post("$_root/discount/code",
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
            "Content-Type": "application/json"
          },
          body: body);

      if (response.statusCode == 200) {
        print("${response.body}");
      } else if (response.statusCode == 203) {
        discountMsg = "Discount code has already been used by you";
      } else {
        discountMsg = "Discount Code Does not exist";
      }
    } catch (execption) {
      print(execption);
    }
  }

  List get itemListing => _cart;
}
