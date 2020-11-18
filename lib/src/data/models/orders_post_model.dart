class Orders {
  List<OrderListItem> orders;
  Orders({this.orders});

  factory Orders.fromJson(Map<String, dynamic> orders) {
    var list = orders['orders'] as List;
    List<OrderListItem> orderItems =
        list.map((i) => OrderListItem.formJson(i)).toList();

    return Orders(orders: orderItems);
  }
}

class OrderListItem {
  int orderid;
  int userid;
  int orderstatid;
  String orderrefno;
  int totalcost;
  int qty;
  int discount;
  int ispaid;
  String created_at;

  OrderListItem(
      {this.orderid,
      this.userid,
      this.orderstatid,
      this.orderrefno,
      this.totalcost,
      this.qty,
      this.discount,
      this.ispaid,
      this.created_at});

  factory OrderListItem.formJson(Map<String, dynamic> orderJson) {
    return OrderListItem(
        orderid: orderJson['orderid'],
        userid: orderJson['userid'],
        orderstatid: orderJson['orderstatid'],
        orderrefno: orderJson['orderrefno'],
        totalcost: orderJson['totalcost'],
        qty: orderJson['qty'],
        discount: orderJson['discount'],
        ispaid: orderJson['ispaid'],
        created_at: orderJson['created_at']);
  }
}
