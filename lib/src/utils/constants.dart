///
 ///Created 11/03/2020
///Contants Class to hold all project constants
 ///Author Eric Lekwa
 ///

class Constants {
  static const BASE_URL = "https://bulkbuyersconnect.com/api/v1";
  static const IMAGE_BASE_URL = "http://bulkbuyersconnect.com";
  static const PAYSTACK_API_LIVE_KEY =
      "pk_live_6ddeaa47abab16a035b0ce5ca97a252b24c11806";

  static const tableShop = "products";
  static const tableCart = "carts";
  static const tableOrders = "orders";
  static const tableOrdersDetails = "orders_details";
  static const tableUser = "user";
  static const tableCategories = "categories";

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
  static const ColumnLName= "lname";
  static const ColumnDOB= "dob";
  static const ColumnAddress= "address";
  static const ColumnEmail= "email";
  static const ColumnProfImg= "profileimg";
  static const ColumnStatus= "status";
  static const ColumnCatImg= "catimg";
  static const ColumnProd= "products";
  static const ColumnProdCatName= "prodcatname";
  static const ColumnCreated = "created_at";
  static const ColumnPhone = "phone";
  static const ColumnOrderDetils = "orderdetails";
  static const ColumnOrderDetilsID = "orderdetailid";

static const about = "Orders are made monthly by members \n starting from the 3rd week of every month till \n the last week of the month with every \n member putting money into a pool fund via a \n secure payment gateway using their \n MasterCard or Visa card on the app or online \n portal for their selected purchases during \n this period. Orders/payments after the 29th day of every month will automatically only \n apply to the next months cycle of purchases. \n \n Note that each member would have chosen  \n from a list of items what their funds will be used to purchase. All purchases are delivered from the last week of the current month into the first week of the new month, a notification will be sent to each member to inform them of their pickup location and time or the delivery time of their product. ";
}
