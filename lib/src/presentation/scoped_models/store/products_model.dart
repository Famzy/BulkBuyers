import 'package:bulk_buyers/src/data/datasource/local/sqflite_database_helper.dart';
import 'package:bulk_buyers/src/data/models/cart_model.dart';
import 'package:bulk_buyers/src/data/models/products_model.dart';
import 'package:scoped_model/scoped_model.dart';

import '../base_model.dart';

export 'package:bulk_buyers/core/enums/view_state.dart';

/// Contains logic for a list view with the general expected functionality.
class ProductViewModel extends Model {
  int id;
  int wishlist;
  List<ProductsModels> listData;
  List _cart = [];
  bool isSuccessful = true;
  String cartMsg = "";
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void setState(ViewState newState) {
    _state = newState;

    // Notify listeners will only update listeners of state.
    notifyListeners();
  }

  Future fetchListData() async {
    setState(ViewState.Busy);

    await Future.delayed(Duration(seconds: 1));
    listData = List<ProductsModels>.generate(
      10,
      (index) => ProductsModels(
        productname: 'title $index',
        description: 'Description of this list Item. $index',
      ),
    );

    for (int i = 0; i < listData.length; i++) {
      //Add to wishList

    }

    if (listData == null) {
      setState(ViewState.Error);
    } else {
      setState(listData.length == 0
          ? ViewState.NoDataAvailable
          : ViewState.DataFetched);
    }
  }

  addToWishList(int id, int wishList) async {
    print(
        "this is the id clicked: $id and this is the wish list status: $wishList");
//      var db = DatabaseHelper();
//      Shop addtoWishList = Shop.fromMap({"productid": id, "wishlist": wishlist});
//      await db.addToWishList(addtoWishList);
  }

  removeFromCart(CartModel cart, int id) async {
//    var db = DatabaseHelper();
//    db.deleteCartItems(id);
    print("This is the ID: $id passed for delete");
  }

  void addToCart(CartModel cart) async {
    print(cart);
    print(_cart);

//    int _index = _cart.indexWhere((product) => product.productid == cart.productid );
//    if(_index > -1){
//      isSuccessful = false;
//     // cartMsg = "${cart.productname.toUpperCase()} already in Cart List.";
//    }
//    else{
    //int res = await db.InsertCartTest(cart);
    //print("This is the Response Code: $res");
    isSuccessful = true;
    // cartMsg = "${cart.productname.toUpperCase()} successfully added in cart list.";
    //}
  }

  getCartCout() async {
    var db = SqfLiteDatabaseHelper();
    int cartCount = await db.getCartCount();
    var cartItems = await db.getCartList();

    print("This is the cart Count: $cartCount");
    print("-------------------------------------");
    print("items in cart are: $cartItems");
  }
}
