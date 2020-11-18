import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/core/utils/theme/font_styles.dart';
import 'package:bulk_buyers/core/utils/theme/ui_reducers.dart';
import 'package:bulk_buyers/src/data/models/categories_model.dart';
import 'package:bulk_buyers/src/presentation/scoped_models/store/categories_view_model.dart';
import 'package:bulk_buyers/src/presentation/widgets/app_bar.dart';
import 'package:bulk_buyers/src/presentation/widgets/app_body.dart';
import 'package:bulk_buyers/src/presentation/widgets/center_message.dart';
import 'package:bulk_buyers/src/presentation/widgets/navigation/buttom_nav.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';

class CategoriesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<CategoriesViewModel>(
      onModelReady: (model) => model.fetchListData(),
      builder: (context, childe, model) => Scaffold(
        appBar: appBar(context: context),
        backgroundColor: Color.fromARGB(242, 243, 243, 243),
        bottomNavigationBar: BottomNav.nav(index: 0),
        body: appBody(child: _getBodyUi(context, model)),
      ),
    );
  }

  Widget _getBodyUi(BuildContext context, CategoriesViewModel model) {
    switch (model.state) {
      case ViewState.Busy:
        return getLoadingUi(context: context);
      case ViewState.NoDataAvailable:
        return noDataUi(context);
      case ViewState.Error:
        return errorUi(context);
      case ViewState.DataFetched:
      default:
        return _getGridUi(
            model,
            ((screenWidth(context) / 1.3) /
                ((screenHeight(context) - kToolbarHeight - 24) / 1.3)));
    }
  }

  Widget _getGridUi(CategoriesViewModel model, asaspectRatio) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1),
        itemCount: model.listData.length,
        itemBuilder: (context, itemIndex) {
          var item = model.listData[itemIndex];
          return _getListItemUi(item, asaspectRatio);
        });
  }

  Widget _getListItemUi(CategoriesModel result, double ratio) {
    return GestureDetector(
      onTap: () => Router.navigator.pushNamed(Router.shopView),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 164,
              width: 165,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(23)),
                  border: Border.all(color: const Color(0xffeaeaea), width: 1)),
              child: CachedNetworkImage(
                imageUrl: "${result.productcatimg}",
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Cooking Oils",
              style: gridLabel,
            )
          ],
        ),
      ),
    );
  }
}
