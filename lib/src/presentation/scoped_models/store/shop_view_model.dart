import 'package:bulk_buyers/src/data/models/products_model.dart';
import 'package:bulk_buyers/src/domain/usecase/products_usecase.dart';
import 'package:meta/meta.dart';
import '../base_model.dart';
export 'package:bulk_buyers/core/enums/view_state.dart';

/// Contains logic for a list view with the general expected functionality.

class ShopViewModel extends BaseModel {
  final ProductsUC productsUC;
  int oldId;
  ShopViewModel({@required ProductsUC products})
      : assert(products != null),
        productsUC = products;

  List<ProductsModels> products = List<ProductsModels>();
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

  void addToCart(
      {int id,
      String name,
      int price,
      int quantity,
      String image,
      int unitprice,
      int discount}) async {}
}
