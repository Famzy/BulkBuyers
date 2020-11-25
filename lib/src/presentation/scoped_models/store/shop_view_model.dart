import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/src/data/models/cart_model.dart';
import 'package:bulk_buyers/src/data/models/products_model.dart';
import 'package:bulk_buyers/src/domain/usecase/products_usecase.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../base_model.dart';
export 'package:bulk_buyers/core/enums/view_state.dart';

/// Contains logic for a list view with the general expected functionality.

class ShopViewModel extends BaseModel {
  final ProductsUC productsUC;
  int oldId;
  bool show = false;
  Color color;
  String msg = "";
  ShopViewModel({@required ProductsUC products})
      : assert(products != null),
        productsUC = products;

  List<ProductsModels> products = List<ProductsModels>();
  List<ProductsModels> wishlist = List<ProductsModels>();
  filteredProducts({int productId}) async {
    oldId = productId;
    setState(ViewState.Busy);
    try {
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
    productsUC.updateWishList(id: id, state: state);
    print(oldId);
    this.filteredProducts(productId: oldId);
    notifyListeners();
  }

  fetchWishList() async {
    print("hit");
    setState(ViewState.Busy);
    wishlist = await productsUC.fetchWishList();
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

  fetchCart(){
    
  }
  void addToCart(
      {@required int id,
      @required String name,
      @required int price,
      @required int quantity,
      @required String image,
      @required int unitprice,
      @required int discount}) async {
    final respons = await productsUC.addToCart(CartModel(
        productid: id,
        unitprice: unitprice,
        totalprice: price,
        productimg: image,
        discount: discount,
        quantity: quantity,
        productname: name));
    print(respons);
    msg = "${name.toUpperCase()} ADDED TO CART";
    color = primarySwatch;
    show = true;
    notifyListeners();
  }
}
