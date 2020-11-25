//
import 'package:bulk_buyers/core/utils/constants.dart';
import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/core/utils/theme/ui_reducers.dart';
import 'package:bulk_buyers/src/data/models/products_model.dart';
import 'package:bulk_buyers/src/presentation/scoped_models/store/shop_view_model.dart';
import 'package:bulk_buyers/src/presentation/views/base_view.dart';
import 'package:bulk_buyers/src/presentation/widgets/app_bar.dart';
import 'package:bulk_buyers/src/presentation/widgets/card_helpers.dart';
import 'package:bulk_buyers/src/presentation/widgets/center_message.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  final String name;
  final int categoryId;

  const ProductListView({Key key, this.name, this.categoryId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<ShopViewModel>(
      onModelReady: (model) => model.filteredProducts(productId: categoryId),
      builder: (context, child, model) => Scaffold(
        appBar: backAppBar(context: context),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: screenWidth(context),
                child: CardHelpers.productCard(name: name),
              ),
            ),
            Expanded(
              flex: 13,
              child: _getBodyUi(context, model),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBodyUi(BuildContext context, ShopViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
        return getLoadingUi(context: context);
      case ViewState.NoDataAvailable:
        return noDataUi(context);
      case ViewState.Error:
        return errorUi(context);
      case ViewState.DataFetched:
      default:
        return _getListUi(model);
    }
  }

  Widget _getListUi(ShopViewModel model) {
    return ListView.builder(
        itemCount: model.products.length,
        itemBuilder: (context, itemIndex) {
          var item = model.products[itemIndex];
          return _getListItemUi(item, model);
        });
  }

//
  Widget _getListItemUi(ProductsModels result, ShopViewModel model) {
    return GestureDetector(
      onTap: () {
        print(result.productid);
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(2.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                //  height: 120,
                width: 120,
                padding: EdgeInsets.all(5),
                child: Column(
                  //  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CachedNetworkImage(
                      // imageUrl: 'http://3.8.238.181/buyers/public/3'
                      imageUrl:
                          "${Constants.IMAGE_BASE_URL}/${result.productimg}",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 4.0),
                      child: Text(result.productname,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 4),
                      child: Text(
                        "\u{20A6} ${result.price.toString()}",
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        print("${result.productid} ${!result.wishlist}");
                        // int id = result.productid;
                        // bool wishlist = result.wishlist;
                        // print("${result.productid} is Liked");
                        model.updateWishList(
                            id: result.productid, state: !result.wishlist);
                      },
                      child: Icon(
                        result.wishlist
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: primarySwatch,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      child: Container(),
                    ),
                    GestureDetector(
                      onTap: () async {
                        //  addToCart(item['price'], 1, item['productId'], 1, item['price'], item['price']);

                        print("${result.productname} is Added to cart");
                      },
                      child: Icon(
                        Icons.add_circle,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
//

}
