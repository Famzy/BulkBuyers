import 'package:bulk_buyers/src/data/models/products_model.dart';
import 'package:bulk_buyers/src/presentation/scoped_models/store/shop_view_model.dart';
import 'package:bulk_buyers/src/presentation/widgets/card_helpers.dart';
import 'package:bulk_buyers/src/presentation/widgets/center_message.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../base_view.dart';
import 'cart_view.dart';

class WishListView extends StatefulWidget {
  @override
  _WishListViewState createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ShopViewModel>(
      onModelReady: (model) => model.fetchWishList(),
      builder: (context, childe, model) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CardHelpers.header(title: "Your Wish List"),
            Expanded(
              child: _getBodyUi(context, model),
            )
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
        return noDataUi(context, json: 'assets/lottie/no_wishlist.json');
      case ViewState.Error:
        return errorUi(context);
      case ViewState.DataFetched:
      default:
        return _getListUi(model);
    }
  }

  Widget _getListUi(ShopViewModel model) {
    return ListView.builder(
        itemCount: model.wishlist.length,
        itemBuilder: (context, itemIndex) {
          var item = model.wishlist[itemIndex];
          return _getListItemUi(item, model);
        });
  }

  Widget _getListItemUi(ProductsModels result, ShopViewModel model) {
    return Text(result.productname);
  }
}
