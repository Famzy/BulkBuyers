class PostOrders {
  int totalcost;
  int discountid;
  int totalqty;
  int discount;
  String address;
  List<dynamic> products;

  PostOrders(
      {this.address,
      this.totalcost,
      this.discountid,
      this.totalqty,
      this.discount,
      this.products});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> order = new Map<String, dynamic>();
    order['totalcost'] = totalcost;
    order['discountid'] = discountid;
    order['totalqty'] = totalqty;
    order['address'] = address;
    order['discount'] = discount;
    order['products'] = products;

    return order;
  }
}

class PayOrders {
  String paymentrefno;
  int totalcost;
  int orderid;

  PayOrders({this.paymentrefno, this.totalcost, this.orderid});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> paidOrders = Map<String, dynamic>();
    paidOrders['paymentrefno'] = paymentrefno;
    paidOrders['totalcost'] = totalcost;
    paidOrders['orderid'] = orderid;

    return paidOrders;
  }
}
