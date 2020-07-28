import 'package:bulk_buyers/src/data/local/sqflite_database_helper.dart';
import 'package:bulk_buyers/src/data/repository.dart';
import 'package:bulk_buyers/src/models/orders_model.dart';

import '../../models/orders_model.dart';
import '../base_model.dart';

export 'package:bulk_buyers/src/enums/view_state.dart';

/// Contains logic for a list view with the general expected functionality.
class OrdersViewModel extends BaseModel {
  List placedOrders = [];
  var repo = Repository();
  var db = SqfLiteDatabaseHelper();

  refreshOrders() async {

    print("orders taped");
    db.clearOrders();
    setState(ViewState.Busy);
   var res = await repo.fetchUserOrders();
   print(res);
    await Future.delayed(Duration(seconds: 3));
    this.fetchListData();
    setState(ViewState.DataFetched);
    notifyListeners();
  }

  Future fetchListData() async {
    repo.fetchUserOrders();
    setState(ViewState.Busy);
    placedOrders = await db.getOrderList();
    await Future.delayed(Duration(seconds: 0));
   // print(placedOrders);
    placedOrders = List<UserOrder>.generate(
        placedOrders.length,
            (index) => UserOrder(
          orderid: placedOrders[index]['orderid'],
          userid: placedOrders[index]['userid'],
          orderstatid: placedOrders[index]['orderstatid'],
          orderrefno: placedOrders[index]['orderrefno'],
          totalcost: placedOrders[index]['totalcost'],
          qty: placedOrders[index]['qty'],
          discount: placedOrders[index]['discount'],
          ispaid: placedOrders[index]['ispaid'] == 1,
          created_at: placedOrders[index]['created_at'],
        ));

    if (placedOrders == null) {
      setState(ViewState.Error);
    } else {
      setState(placedOrders.length == 0
          ? ViewState.NoDataAvailable
          : ViewState.DataFetched);
    }
  }

  getOrderDetails(int id) async{
    print("this is from the scpoed model $id");
//   List _list = await db.getOrderList();
//    int _index =_list.indexWhere((item) => item['orderid'] == id);

  //  UserOrder order = await db.getOrderDetails(19);

   // print("this is the index: $_index");etaik
   // var orderDetaiils = order.orderdetails;
   // print("Got Order 19 with items: $orderDetaiils");
    //print("${_list[_index]}");


  }

  // List get orders => _orders;

}
