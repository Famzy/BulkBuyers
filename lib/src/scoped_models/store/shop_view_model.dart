import 'dart:convert';
import 'dart:io';

import 'package:bulk_buyers/src/data/local/database_helper.dart';
import 'package:bulk_buyers/src/data/remote/model/store_api_provider.dart';
import 'package:bulk_buyers/src/data/repository.dart';
import 'package:bulk_buyers/src/models/cart_model.dart';
import 'package:bulk_buyers/src/models/cart_items.dart';
import 'package:bulk_buyers/src/models/discount_models.dart';
import 'package:bulk_buyers/src/models/products_model.dart';
import 'package:bulk_buyers/src/models/place_order_model.dart';
import 'package:bulk_buyers/src/models/search_model.dart';
import 'package:bulk_buyers/src/models/shop_model.dart';
import 'package:bulk_buyers/src/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../base_model.dart';
export 'package:bulk_buyers/src/enums/view_state.dart';

/// Contains logic for a list view with the general expected functionality.

class ShopViewModel extends BaseModel {
  
  static final ShopViewModel _instance = new ShopViewModel.internal();
  factory ShopViewModel() => _instance;
  ShopViewModel.internal();
  HttpClient dicountClient = new HttpClient();
  List<StoreItems> listData;
  var items = List<String>();
  var store = List<String>();
  List _productData = [];
  List _cart = [];
  List _details = [];
  List _wishlist = [];
  List _checkout = [];
  bool isSuccessful = true;
  String cartMsg = "";
  String discountMsg = "";
  String subtotal;
  int total;
  int totalQty;
  double discount = 0;
  int disID = 0;
  int id = 0;
  double percentage = 0;
  bool isDiscounted = false;

  var db = new DatabaseHelper();
  var api = new ApiProvider();
  var repo = new Repository();
  final _root = Constants.BASE_URL;

  Future populateShop() async {
    var res = repo.fetchUser();
    res = repo.fetchProducts();
    this.fetchCartData();
    repo.fetchUserOrders();
    this.fecthStoreProducts();
    notifyListeners();
    print(res);
  }

  Future fecthStoreProducts() async {
     var res = repo.fetchProducts();
       print(res);
    setState(ViewState.Busy);
    _productData = await db.getAllProducts();
    for (int i = 0; i < _productData.length; i++) {
      Shop shop = Shop.map(_productData[i]);
      items.add("${_productData[i]['productname'].toLowerCase()} \u{20A6}${_productData[i]['price']}");
      store.add("${_productData[i]['productname'].toLowerCase()} \u{20A6} ${_productData[i]['price']}");

    }

    print(items);
    await Future.delayed(Duration(seconds: 0));

    _productData = List<StoreItems>.generate(
        _productData.length,
        (index) => StoreItems(
            productname: _productData[index]['productname'],
            description: _productData[index]['description'],
            productid: _productData[index]['productid'],
            productimg: _productData[index]['productimg'],
            discount: _productData[index]['discount'],
            price: _productData[index]['price'],
            wishlist: _productData[index]['wishlist'] == 0,
            quantity: _productData[index]['quantity']));
            

    if (_productData == null) {
      setState(ViewState.Error);
    } else {
      setState(_productData.length == 0
          ? ViewState.NoDataAvailable
          : ViewState.DataFetched);
    }
    notifyListeners();
  }

  List get shopListing => _productData;
  List get cartListing => _cart;
  List get productDetails => _details;
  List get wishListing => _wishlist;

  /*
  *
  * Wish List Section
  * Add to wish List
  * Show All items in Wish List
  * */
  updateWishlist(int id, bool state) {
    var reponse = db.addToWishList(id, state);

    print(reponse);
    this.fecthStoreProducts();
    this.fetchWishList();
    notifyListeners();
  }

  Future fetchWishList() async {
    setState(ViewState.Busy);

    _wishlist = await db.getWishLists();
    for (int i = 0; i < _wishlist.length; i++) {
      Shop shop = Shop.map(_wishlist[i]);
    }

    await Future.delayed(Duration(seconds: 0));

    _wishlist = List<StoreItems>.generate(
        _wishlist.length,
        (index) => StoreItems(
            productname: _wishlist[index]['productname'],
            description: _wishlist[index]['description'],
            productid: _wishlist[index]['productid'],
            productimg: _wishlist[index]['productimg'],
            price: _wishlist[index]['price'],
            wishlist: _wishlist[index]['wishlist'] == 0,
            quantity: _wishlist[index]['quantity']));

    if (_wishlist == null) {
      setState(ViewState.Error);
    } else {
      setState(_wishlist.length == 0
          ? ViewState.NoDataAvailable
          : ViewState.DataFetched);
    }
  }

  // --------------------- End Wish List Section ---------------
/*
* Cart Section
* Add to cart
* Remove From Cart
* Show List of Items in the Cart.
* Update the Cart Price
* */

  Future fetchCartData() async {
    setState(ViewState.Busy);

    _cart = await db.getCartList();
    for (int i = 0; i < _cart.length; i++) {
      Cart cart = Cart.map(_cart[i]);
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
      int unitprice, int discount) async {
    _cart = await db.getCartList();

    int _index = _cart.indexWhere((item) => item['productid'] == id);
    if (_index > -1) {
      isSuccessful = false;
      cartMsg = "${name.toUpperCase()} already in Cart .";
      print(cartMsg);
    } else {
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

  getDiscount(String discountCode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString("token");

    Discount discount = Discount(code: discountCode);
    var body = discount.toJson();
    try {
      dicountClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      String url = "$_root/discount/code";
      HttpClientRequest request = await dicountClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.headers.set('authorization', 'Bearer $token');
      request.add(utf8.encode(json.encode(body)));
      HttpClientResponse response = await request.close();
      int status = await response.statusCode;
      var res = await response.transform(utf8.decoder).join();
      var value = json.decode(res);

      switch (status) {
        case HttpStatus.ok:
          var code = value['percent'];
          percentage = code.toDouble();
          id = value['discountid'];
          print("this is the percentage: $percentage");
          isDiscounted = true;
          discountMsg = "";
          this.sum();
          notifyListeners();
          break;
        case HttpStatus.nonAuthoritativeInformation:
          discountMsg = "You have used this code before";
          break;
        default:
          discountMsg = "Discount Code Does not exist";
          break;
      }
    } catch (execption) {
      print(execption);
    }
    notifyListeners();
  }

  undoDiscount() async {
    id = 0;
    percentage = 0;
    this.sum();
    isDiscounted = false;
    notifyListeners();
  }

  sum() async {
    var sumation = await db.cartTotalPrice();

    subtotal = sumation.toString();
    try {
      disID = id;
      discount = (sumation / 100 * percentage).roundToDouble();
      print(
          "$this is the percentage: $percentage and this is the discout amount: ${discount.roundToDouble()}");
      print("this is the dicounted Value $discount");
      total = sumation - discount.round();
      print("this is the final price after discount");
      // total = 500 + sumation;
    } on Exception catch (e) {
      print(e);
    }
    notifyListeners();
  }
getProductFromSearch(int index){
  print(_productData[index].productname);
  this.addToCart(_productData[index].productid, _productData[index].productname, _productData[index].price, _productData[index].quantity, _productData[index].productimg, _productData[index].price, _productData[index].discount);
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

  removeFromCart(int id) async {
    print("This is the ID: $id passed for delete");
    var response = await db.deleteCartItems(id);
    this.fetchCartData();
    print(response);
    notifyListeners();
  }

  completeOrder(
      String ref, int discountid, int discount, String address) async {
    var sumation = await db.cartTotalPrice();
    var storeTotal = sumation - discount;
    _checkout = await db.getCartCheckoutItems();
    totalQty = await db.cartTotalQuantities();
    print(
        "totalcost: $storeTotal, totalQTY: $totalQty, payref: $ref, products: $_checkout");
    var order = await api.postOrders(PostOrders(
        totalcost: storeTotal,
        totalqty: totalQty,
        discountid: discountid,
        discount: discount,
        paymentrefno: ref,
        address: address,
        products: _checkout));
    //print(_checkout);
    print(order);

    var response = await db.clearCartDB();
    print(response);
  }

   void filterSearch(String query){
    List<String> dummuySearchList = List<String>();
    dummuySearchList.addAll(items);
    if(query.isEmpty){
      List<String> dummyListData = List<String>();
      dummuySearchList.forEach((stuff){
        if(stuff.contains(query)){
          dummyListData.add(stuff);
        }
      });
      items.clear();
      items.addAll(store);
    }
  }
}


