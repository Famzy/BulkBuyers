import 'package:bulk_buyers/src/data/models/products_model.dart';
import 'package:bulk_buyers/src/presentation/scoped_models/store/shop_view_model.dart';
import 'package:bulk_buyers/src/presentation/widgets/app_bar.dart';
import 'package:bulk_buyers/src/presentation/widgets/card_helpers.dart';
import 'package:bulk_buyers/src/presentation/widgets/center_message.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../base_view.dart';
import 'cart_view.dart';

class WishListViewTB extends StatefulWidget {
  @override
  _WishListViewTBState createState() => _WishListViewTBState();
}

class _WishListViewTBState extends State<WishListViewTB> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ShopViewModel>(
      onModelReady: (model) => model.fetchWishList(),
      builder: (context, childe, model) => Scaffold(
        appBar: backAppBar(context: context),
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
        return noDataUi(context,
            json: 'assets/lottie/no_wishlist.json',
            text: "Your Wish List is Empty");
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
