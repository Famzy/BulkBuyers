import 'package:bulk_buyers/core/utils/constants.dart';
import 'package:bulk_buyers/src/data/models/cart_model.dart';
import 'package:bulk_buyers/src/data/models/categories_model.dart';
import 'package:bulk_buyers/src/data/models/products_model.dart';
import 'package:bulk_buyers/src/domain/usecase/categories_usecase.dart';
import 'package:bulk_buyers/src/domain/usecase/products_usecase.dart';
import 'package:meta/meta.dart';

import '../base_model.dart';
export 'package:bulk_buyers/core/enums/view_state.dart';

/// Contains logic for a list view with the general expected functionality.
class CategoriesViewModel extends BaseModel {
  final CategoriesUC categoriesUC;
  final ProductsUC productsUC;

  CategoriesViewModel(
      {@required CategoriesUC category, @required ProductsUC products})
      : assert(category != null),
        assert(products != null),
        productsUC = products,
        categoriesUC = category;

  List listData = [];
  List<CategoriesModel> categories = List<CategoriesModel>();

  Future fetchListData() async {
    setState(ViewState.Busy);
    final data = await productsUC.get();
    data.fold(
        (failure) => setState(ViewState.Error),
        (categoryData) => {
              print(" this is Cat VM: $categoryData"),
              setState(ViewState.Success),
//              categories = categoryData
            });

    listData = List<CategoriesModel>.generate(
        8,
        (index) => CategoriesModel(
              prodcatid: 1,
              prodcatname: "rice",
              status: 1,
              productcatimg:
                  "${Constants.IMAGE_BASE_URL}/products/cat/category2.jpg",
            ));
  }
}
