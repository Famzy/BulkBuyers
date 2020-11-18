import 'package:bulk_buyers/src/data/models/products_model.dart';

import '../base_model.dart';

export 'package:bulk_buyers/core/enums/view_state.dart';

/// Contains logic for a list view with the general expected functionality.
class ProductGridViewModel extends BaseModel {
  List<ProductsModels> listData;

  Future fetchListData() async {
    setState(ViewState.Busy);

    await Future.delayed(Duration(seconds: 1));
    listData = List<ProductsModels>.generate(
        10,
        (index) => ProductsModels(
            productname: 'title $index',
            description: 'Description of this list Item. $index'));

    if (listData == null) {
      setState(ViewState.Error);
    } else {
      setState(listData.length == 0
          ? ViewState.NoDataAvailable
          : ViewState.DataFetched);
    }
  }
}
