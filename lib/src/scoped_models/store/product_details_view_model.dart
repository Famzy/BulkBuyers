import 'package:bulk_buyers/src/data/local/database_helper.dart';

import '../base_model.dart';
class ProductDetailsViewModel extends BaseModel {
  String productimg;
  getDetails(id)async{

    var db = DatabaseHelper();
    var productDetails = await db.getProduct(id);
    print("this is what is to displayed: $productDetails");
    //productimg = productDetails.productimg;
    productimg = "";
   // print(productDetails.productname);
    return productDetails;
  }
}