import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/src/data/models/cart_model.dart';
import 'package:bulk_buyers/src/data/models/products_model.dart';
import 'package:bulk_buyers/src/domain/usecase/cart_usecase.dart';
import 'package:bulk_buyers/src/domain/usecase/products_usecase.dart';
import 'package:bulk_buyers/src/domain/usecase/wishlist_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../base_model.dart';
export 'package:bulk_buyers/core/enums/view_state.dart';

/// Contains logic for a list view with the general expected functionality.

class ShopViewModel extends BaseModel {
  final ProductsUC productsUC;
  final WishListUC wishListUC;
  final CartUC cartUC;
  //variables
  bool hasData;
  int subtotal;
  double discount = 0;
  int disID = 0;
  int id = 0;
  int total;
  double percentage = 0;
  int oldId;
  bool show = false;
  bool isDiscounted = false;
  Color color;
  String msg = "";
  String discountMsg = "";

  // Constructor
  ShopViewModel(
      {@required ProductsUC products,
      @required WishListUC wishlist,
      @required CartUC cart})
      : assert(products != null),
        assert(cart != null),
        assert(wishlist != null),
        cartUC = cart,
        wishListUC = wishlist,
        productsUC = products;

  List<ProductsModels> products = List<ProductsModels>();
  List<ProductsModels> wishlist = List<ProductsModels>();
  List<CartModel> cartItem = List<CartModel>();
  List<CartModel> cart = List<CartModel>();

  filteredProducts({int productId}) async {
    oldId = productId;
    setState(ViewState.Busy);
    try {
      final cert = await cartUC.fetchCart();
      print(cert);
      final stock = await productsUC.getFilter(id: productId);

      stock.fold(
          (failure) => setState(ViewState.Error),
          (stockData) => {
                print(" this is Cat VM: $stockData"),
                setState(ViewState.Success),
                products = stockData
              });
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  getProducts() async {
    setState(ViewState.Busy);
    try {
      final cert = await cartUC.fetchCart();
      print(cert);
      final stock = await productsUC.get();

      stock.fold(
          (failure) => setState(ViewState.Error),
          (stockData) => {
                print(" this is Cat VM: $stockData"),
                setState(ViewState.Success),
                products = stockData
              });
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  updateWishList({int id, bool state}) async {
    wishListUC.updateWishList(id: id, state: state);
    print(oldId);
    this.filteredProducts(productId: oldId);
    notifyListeners();
  }

  fetchWishList() async {
    print("hit");
    setState(ViewState.Busy);
    wishlist = await wishListUC.fetchWishList();
    if (wishlist == null) {
      setState(ViewState.Error);
    } else {
      setState(wishlist.length == 0
          ? ViewState.NoDataAvailable
          : ViewState.DataFetched);
    }
  }

  viewProduct({int id}) async {
    ProductsModels models = await productsUC.getProductDetails(id);
    print(models.productid);
    Router.navigator.pushNamed(Router.productDetails,
        arguments: ProductDetailsViewArguments(
          id: models.productid,
          price: models.price,
          quantity: models.quantity,
          image: models.productimg,
          discount: models.discount,
          name: models.productname,
        ));
  }

  getDiscount(Strin) {}

  fetchCart() async {
    setState(ViewState.Busy);
    cart = await cartUC.fetchCart();
    this.sum();
    if (cart == null) {
      setState(ViewState.Error);
    } else {
      setState(
          cart.length == 0 ? ViewState.NoDataAvailable : ViewState.DataFetched);
    }
    notifyListeners();
  }

  void addToCart({CartModel cartModel}) async {
    int _index =
        cartItem.indexWhere((cart) => cart.productid == cartModel.productid);
    if (_index > -1) {
      msg = "${cartModel.productname.toUpperCase()} ALREADY IN CART";
      color = Colors.red;
      show = true;
    } else {
      cartItem.add(CartModel(
          productid: cartModel.productid,
          unitprice: cartModel.unitprice,
          totalprice: cartModel.totalprice,
          productimg: cartModel.productimg,
          discount: cartModel.discount,
          quantity: cartModel.quantity,
          productname: cartModel.productname));
      final respons = await cartUC.addToCart(cartModel);
      print(respons);
      msg = "${cartModel.productname.toUpperCase()} ADDED TO CART";
      color = primarySwatch;
      show = true;
    }

    notifyListeners();
  }

  updateCartPrice({int id, int price, int qty}) async {
    cartUC.updateCartItems(id: id, price: price, qty: qty);
    this.fetchCart();
    notifyListeners();
  }

  removeFromCart(int id) async {
    cartItem.removeWhere((cart) => cart.productid == id);
    await cartUC.removeFromCart(id);
    this.fetchCart();
    notifyListeners();
  }

  sum() async {
    final summation = await cartUC.cartTotal();
    subtotal = summation;
    try {
      disID = id;
      discount = (summation / 100 * percentage).roundToDouble();
      print(
          "$this is the percentage: $percentage and this is the discout amount: ${discount.roundToDouble()}");
      print("this is the dicounted Value $discount");
      total = summation - discount.round();
      print("this is the final price after discount");
    } catch (e, s) {
      print(s);
    }
    notifyListeners();
  }

  checkout() {
    Router.navigator.pushNamed(Router.payment,
        arguments: PaymentViewArguments(
            total: total, discount: discount.toInt(), discountid: disID));
  }
}
