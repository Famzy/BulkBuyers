class DBConst {
  //Table Column Fields
  static const ColumnID = "id";
  static const ColumnProdID = "productid";
  static const ColumnProdCatID = "prodcatid";
  static const ColumnProdName = "productname";
  static const ColumnDescrpt = "description";
  static const ColumnProdImg = "productimg";
  static const ColumnProdPrice = "price";
  static const ColumnProdUnitPrice = "unitprice";
  static const ColumnProdDiscnt = "discount";
  static const ColumnProdWishLst = "wishlist";
  static const ColumnCartID = "cartid";
  static const ColumnProdQty = "quantity";
  static const ColumnProdTotalPrice = "totalprice";
  static const ColumnPaid = "ispaid";
  static const ColumnOrderID = "orderid";
  static const ColumnUserID = "userid";
  static const ColumnOrderStatID = "orderstatid";
  static const ColumnTotalCost = "totalcost";
  static const ColumnOrderQTY = "qty";
  static const ColumnOrderRefNum = "orderrefno";
  static const ColumnOrderTime = "created_at";
  static const ColumnUserProfFld = "userprofileid";
  static const ColumnStatID = "stateid";
  static const ColumnFName = "fname";
  static const ColumnLName = "lname";
  static const ColumnDOB = "dob";
  static const ColumnAddress = "address";
  static const ColumnEmail = "email";
  static const ColumnProfImg = "profileimg";
  static const ColumnStatus = "status";
  static const ColumnCatImg = "catimg";
  static const ColumnProd = "products";
  static const ColumnProdCatName = "prodcatname";
  static const ColumnCreated = "created_at";
  static const ColumnPhone = "phone";
  static const ColumnOrderDetils = "orderdetails";
  static const ColumnOrderDetilsID = "orderdetailid";
  static const tableShop = "products";
  static const cartTable = "carts";
  static const tableOrders = "orders";
  static const tableOrdersDetails = "orders_details";
  static const tableUser = "user";
  static const tableCategories = "categories";
}

class RemoteConst {
  static const BASE_URL = "https://bulkbuyersconnect.com/api/v1";
  static const IMAGE_BASE_URL = "http://bulkbuyersconnect.com";
}

mixin EndPoints {
  String auth = "${RemoteConst.BASE_URL}/access";
  String discount = "${RemoteConst.BASE_URL}/discount/code";
  String orderList = "${RemoteConst.BASE_URL}/order/list";
  String orderDetail = "${RemoteConst.BASE_URL}/order/details/";
  String postOrder = "${RemoteConst.BASE_URL}/order/add";
  String paidOrder = "${RemoteConst.BASE_URL}/order/pay";
  String product = "${RemoteConst.BASE_URL}/product/list";
  String productDetails = "${RemoteConst.BASE_URL}/product/detail";
  String signup = "${RemoteConst.BASE_URL}/register";
  String users = "${RemoteConst.BASE_URL}/user";
  String categories = "${RemoteConst.BASE_URL}/category/list";
  String wishList = "${RemoteConst.BASE_URL}/wishlist";
  String addWishList = "${RemoteConst.BASE_URL}/wishlist/add";
  String removeWishList = "${RemoteConst.BASE_URL}/wishlist/delete";
  String tempCart = "${RemoteConst.BASE_URL}/cart/add";
  String tempCartList = "${RemoteConst.BASE_URL}/cart/list";
  String forgotPassword = "${RemoteConst.BASE_URL}/user/reset";
  String editProfile = "${RemoteConst.BASE_URL}/user/edit";
}
