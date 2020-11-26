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
  int oldId;
  bool show = false;
  bool isDiscounted = false;
  Color color;
  String msg = "";
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
  List<CartModel> cart = List<CartModel>();
  List<CartModel> cartItem = List<CartModel>();
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

    setState(ViewState.Success);
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
    setState(ViewState.Success);
  }

  void addToCart(
      {@required int id,
      @required String name,
      @required int price,
      @required int quantity,
      @required String image,
      @required int unitprice,
      @required int discount}) async {
    try {
      cartItem.add(CartModel(
          productid: id,
          unitprice: unitprice,
          totalprice: price,
          productimg: image,
          discount: discount,
          quantity: quantity,
          productname: name));
    } catch (e, s) {
      print(s);
      print("this is the value of e: $e");
    }
    print(cartItem.length);
    final respons = await cartUC.addToCart(cartItem);
    print(respons);
    msg = "${name.toUpperCase()} ADDED TO CART";
    color = primarySwatch;
    show = true;
    notifyListeners();
  }

  updateCartPrice(int id, int price, int qty) {}
  removeFromCart(int id) {
    print("hit");
  }
}
