import 'package:bulk_buyers/core/router/routes.gr.dart';
import 'package:bulk_buyers/core/utils/constants.dart';
import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/core/utils/theme/font_styles.dart';
import 'package:bulk_buyers/core/utils/theme/ui_reducers.dart';
import 'package:bulk_buyers/src/data/models/categories_model.dart';
import 'package:bulk_buyers/src/presentation/scoped_models/store/categories_view_model.dart';
import 'package:bulk_buyers/src/presentation/widgets/app_body.dart';
import 'package:bulk_buyers/src/presentation/widgets/card_helpers.dart';
import 'package:bulk_buyers/src/presentation/widgets/center_message.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../base_view.dart';

class CategoriesView extends StatefulWidget {
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BaseView<CategoriesViewModel>(
      onModelReady: (model) => model.fetchListData(),
      builder: (context, childe, model) => Scaffold(
        //    appBar: appBar(context: context),
        backgroundColor: Color.fromARGB(242, 243, 243, 243),
        // bottomNavigationBar: BottomNav.nav(index: 0),
        body: appBody(
            child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                width: screenWidth(context),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: screenHeight(context) / 25,
                      color: primarySwatch,
                      child: Center(
                        child: Text(
                          "DEALS OF THE SEASON",
                          style: TextStyle(
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Avenir",
                              fontStyle: FontStyle.normal,
                              fontSize: 16.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) / 55,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          CardHelpers.promoCard(
                            context: context,
                            onTap: () => Router.navigator.pushNamed(
                                Router.productList,
                                arguments: ProductListViewArguments(
                                    name: "SPECIAL DEALS", categoryId: 8)),
                          ),
                          CardHelpers.promoCard(
                            context: context,
                            image: "promo1",
                            onTap: () => Router.navigator.pushNamed(
                                Router.productList,
                                arguments: ProductListViewArguments(
                                    name: "SPECIAL DEALS", categoryId: 8)),
                          ),
                          CardHelpers.promoCard(
                            context: context,
                            image: "promo2",
                            onTap: () => Router.navigator.pushNamed(
                                Router.productList,
                                arguments: ProductListViewArguments(
                                    name: "SPECIAL DEALS", categoryId: 8)),
                          ),
                          CardHelpers.promoCard(
                            context: context,
                            image: "promo3",
                            onTap: () => Router.navigator.pushNamed(
                                Router.productList,
                                arguments: ProductListViewArguments(
                                    name: "DEALS", categoryId: 8)),
                          ),
                          CardHelpers.promoCard(
                            context: context,
                            image: "promo4",
                            onTap: () => Router.navigator.pushNamed(
                                Router.productList,
                                arguments: ProductListViewArguments(
                                    name: "SPECIAL DEALS", categoryId: 8)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context) / 70,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: Text(
                              "CATEGORIES",
                              style: TextStyle(
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Avenir",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () =>
                                Router.navigator.pushNamed(Router.shopView),
                            child: Container(
                              height: screenHeight(context) / 45,
                              margin: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                color: primarySwatch,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                "All Products",
                                style: TextStyle(color: whiteSwatch),
                              )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: _getBodyUi(context, model),
            ),
          ],
        )),
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
        itemCount: model.categories.length,
        itemBuilder: (context, itemIndex) {
          var item = model.categories[itemIndex];
          return _getListItemUi(item, asaspectRatio);
        });
  }

  Widget _getListItemUi(CategoriesModel result, double ratio) {
    return GestureDetector(
      onTap: () => Router.navigator.pushNamed(Router.productList,
          arguments: ProductListViewArguments(
              name: result.prodcatname, categoryId: result.prodcatid)),
      //  onTap: () => print(result.prodcatid.toString()),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: screenHeight(context) < 200
                  ? screenHeight(context) / 4.9
                  : screenHeight(context) / 5.5,
              width: screenWidth(context) / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(23)),
                  border: Border.all(color: const Color(0xffeaeaea), width: 1)),
              child: CachedNetworkImage(
                imageUrl: "${Constants.IMAGE_BASE_URL}/${result.productcatimg}",
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              result.prodcatname,
              style: gridLabel,
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
