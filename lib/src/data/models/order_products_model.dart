class OrderProducts {
  int productid;
  int prodcatid;
  String productname;
  String description;
  int price;
  double discount;
  int status;
  String productimg;

  OrderProducts({
    this.productid,
    this.prodcatid,
    this.productname,
    this.description,
    this.price,
    this.discount,
    this.status,
    this.productimg,
  });

  factory OrderProducts.fromJson(Map<String, dynamic> json) => OrderProducts(
    productid: json["productid"],
    prodcatid: json["prodcatid"],
    productname: json["productname"],
    description: json["description"],
    price: json["price"],
    discount: json["discount"],
    status: json["status"],
    productimg: json["productimg"],
  );

  Map<String, dynamic> toJson() => {
    "productid": productid,
    "prodcatid": prodcatid,
    "productname": productname,
    "description": description,
    "price": price,
    "discount": discount,
    "status": status,
    "productimg": productimg,
  };

  OrderProducts.fromMap(
      Map<String, dynamic> map,
      ) {
    this.productid = map['productid'];
    this.prodcatid = map['prodcatid'];
    this.productname = map['productname'];
    this.description = map['description'];
    this.price = map['price'];
    this.discount = map['discount'];
    this.status = map['status'];
    this.productimg = map['productimg'];
  }
}