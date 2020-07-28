import 'package:bulk_buyers/src/data/local/sqflite_database_helper.dart';
import 'package:bulk_buyers/src/data/repository.dart';
import 'package:bulk_buyers/src/models/order_details_model.dart';

import '../base_model.dart';

export 'package:bulk_buyers/src/enums/view_state.dart';

var db = SqfLiteDatabaseHelper();
var repo = Repository();

/// Contains logic for a list view with the general expected functionality.
class OrderDetailsViewModel extends BaseModel {
  List _orderDetails = [];

  Future fetchListData(id) async {
    print("this is from the scpoed model $id");
    setState(ViewState.Busy);
    _orderDetails = await repo.getOrderDetails(id);

    await Future.delayed(Duration(seconds: 2));
    _orderDetails = List<OrderDetails>.generate(
        _orderDetails.length,
        (index) => OrderDetails(
              productname: _orderDetails[index]['productname'],
              description: _orderDetails[index]['description'],
              quantity: _orderDetails[index]['quantity'],
          unitprice: _orderDetails[index]['unitprice'],
          totalprice: _orderDetails[index]['totalprice'],

            ));

    if (_orderDetails == null) {
      setState(ViewState.Error);
    } else {
      setState(_orderDetails.length == 0
          ? ViewState.NoDataAvailable
          : ViewState.DataFetched);
    }
  }

  List get orderDetails => _orderDetails;
}
