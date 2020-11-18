import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../base_view.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return BaseView<ProfileViewModel>(
//      onModelReady: (model) => model.loadUserDetails(),
//      builder: (context, child, model) => Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.black,
//          leading: GestureDetector(
//              onTap: () => Navigator.pop(context),
//              child: Icon(Icons.arrow_back_ios)),
//          actions: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Image.asset("assets/images/icon.png"),
//            )
//          ],
//        ),
//        bottomNavigationBar: BottomAppBar(
//          color: Colors.transparent,
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              InkWell(
//                onTap: () {
//                  Navigator.push(
//                      context,
//                      PageRouteBuilder(
//                          transitionDuration: const Duration(milliseconds: 350),
//                          pageBuilder: (context, _, __) => ShopView()));
//                },
//                child: Container(
//                  height: 58,
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                          child: IconButton(
//                        icon: Image.asset('assets/images/home.png'),
//                        onPressed: () {
//                          Navigator.push(
//                              context,
//                              PageRouteBuilder(
//                                  transitionDuration:
//                                      const Duration(milliseconds: 350),
//                                  pageBuilder: (context, _, __) => ShopView()));
//                        },
//                      )),
//                      Text(
//                        'Home',
//                        style: TextStyle(color: Colors.blue),
//                      )
//                    ],
//                  ),
//                ),
//              ),
//              InkWell(
//                onTap: () {
//                  Navigator.push(
//                      context,
//                      PageRouteBuilder(
//                          transitionDuration: const Duration(milliseconds: 350),
//                          pageBuilder: (context, _, __) => CartView()));
//                },
//                child: Container(
//                  height: 58,
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                          child: IconButton(
//                        icon: Image.asset('assets/images/cart.png'),
//                        onPressed: () {
//                          Navigator.push(
//                              context,
//                              PageRouteBuilder(
//                                  transitionDuration:
//                                      const Duration(milliseconds: 350),
//                                  pageBuilder: (context, _, __) => CartView()));
//                        },
//                      )),
//                      Text(
//                        'Cart',
//                        style: TextStyle(color: Colors.blue),
//                      )
//                    ],
//                  ),
//                ),
//              ),
//              InkWell(
//                onTap: () {
//                  Navigator.push(
//                      context,
//                      PageRouteBuilder(
//                          transitionDuration: const Duration(milliseconds: 350),
//                          pageBuilder: (context, _, __) => WishListView()));
//                },
//                child: Container(
//                  height: 58,
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                          child: IconButton(
//                        icon: Image.asset('assets/images/wishlist.png'),
//                        onPressed: () {
//                          Navigator.push(
//                              context,
//                              PageRouteBuilder(
//                                  transitionDuration:
//                                      const Duration(milliseconds: 350),
//                                  pageBuilder: (context, _, __) =>
//                                      WishListView()));
//                        },
//                      )),
//                      Text('Wish List', style: TextStyle(color: Colors.blue))
//                    ],
//                  ),
//                ),
//              ),
//              InkWell(
//                onTap: () {},
//                child: Container(
//                  height: 58,
//                  child: Column(
//                    children: <Widget>[
//                      Expanded(
//                          child: IconButton(
//                        icon: Image.asset(
//                          'assets/images/you_selected.png',
//                        ),
//                        onPressed: () {},
//                      )),
//                      Text('You', style: TextStyle(color: primarySwatch))
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//        backgroundColor: Color.fromARGB(242, 243, 243, 243),
//        body: Container(
//          width: double.infinity,
//          margin: EdgeInsets.only(bottom: 10.0),
//          decoration: BoxDecoration(
//              color: whiteSwatch,
//              borderRadius: BorderRadius.only(
//                  bottomLeft: Radius.circular(20.0),
//                  bottomRight: Radius.circular(20.0))),
//          child: SingleChildScrollView(
//            child: SafeArea(
//              child: Column(
//                children: <Widget>[
//                  UIHelper.verticalSpaceSmall(),
//                  Row(
//                    children: <Widget>[
//                      UIHelper.horizontalSpaceSmall(),
//                      ClipOval(
//                        child: Container(
//                          width: 90.0,
//                          child: Image.asset('assets/images/profile.jpg'),
//                        ),
//                        // child: Container(
//                        //   width: 100.0,
//                        //   padding: EdgeInsets.all(5.0),
//                        //   child: CachedNetworkImage(
//                        //     imageUrl:
//                        //         // "${Constants.IMAGE_BASE_URL}/products/15831265571574434721product9.jpg",
//                        //         'https://www.pinterest.com/pin/294071050672853929/',
//                        //     placeholder: (context, url) =>
//                        //         Center(child: CircularProgressIndicator()),
//                        //     errorWidget: (context, url, error) =>
//                        //         const Icon(Icons.error),
//                        //   ),
//                        // ),
//                      ),
//                      UIHelper.horizontalSpaceSmall(),
//                      Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Text(
//                            (() {
//                              if(model.address == null)
//                              {
//                                return  "N/A";
//                              }
//                              return "${model.fullname}";
//                            })(),
//
//                            style: subHeading3Black,
//                          ),
//                          UIHelper.verticalSpace(5.0),
//                          Text(
//                            "Joined since ${model.joined}",
//                            style: display4Light,
//                            textAlign: TextAlign.left,
//                          ),
//                          UIHelper.verticalSpaceSmaller(),
//                          GestureDetector(
//                            onTap: ()=>  Navigator.push(
//                                context,
//                                PageRouteBuilder(
//                                    transitionDuration: const Duration(milliseconds: 350),
//                                    pageBuilder: (context, _, __) => OrdersView())),
//                            child: Row(
//                              children: <Widget>[
//                                Text(
//                                  "TOTAL \n ORDERS",
//                                  textAlign: TextAlign.center,
//                                  style: TextStyle(color: graySwatch),
//                                ),
//                                UIHelper.horizontalSpace(10.0),
//                                Container(
//                                  padding: EdgeInsets.only(
//                                      left: 10, right: 10, top: 5),
//                                  decoration: BoxDecoration(
//                                    borderRadius: BorderRadius.circular(10),
//                                    color: primarySwatch,
//                                  ),
//                                  child: Text(
//                                    "${model.totalOrders}",
//                                    style: smallHeading,
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
//                    ],
//                  ),
//                  UIHelper.verticalSpaceSmaller(),
//                  Container(
//                    decoration: BoxDecoration(
//                      color: blueGradient,
//                    ),
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Text(
//                            "PRIMARY DETAILS",
//                            style: subHeading4,
//                          ),
//                          GestureDetector(
//                              onTap: () => Navigator.push(
//                                  context,
//                                  PageRouteBuilder(
//                                      transitionDuration:
//                                          const Duration(milliseconds: 350),
//                                      pageBuilder: (context, _, __) =>
//                                          EditProfileView())),
//                              child: Image.asset('assets/images/edit.png'))
//                        ],
//                      ),
//                    ),
//                  ),
//                  Container(
//                    height: 40,
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Row(
//                        children: <Widget>[
//                          Padding(
//                            padding: const EdgeInsets.only(left: 8.0),
//                            child: SvgPicture.asset('assets/svgs/user.svg'),
//                          ),
//                          UIHelper.horizontalSpaceSmall(),
//                          Text(
//                            (() {
//                              if(model.address == null)
//                              {
//                                return  "N/A";
//                              }
//                              return "${model.firstName}";
//                            })(),
//
//                            style: TextStyle(fontSize: 15),
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
//                  Divider(),
//                  Container(
//                    height: 40,
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Row(
//                        children: <Widget>[
//                          Padding(
//                            padding: const EdgeInsets.only(left: 8.0),
//                            child: SvgPicture.asset('assets/svgs/user_tie.svg'),
//                          ),
//                          UIHelper.horizontalSpaceSmall(),
//                          Text(
//                            (() {
//                              if(model.address == null)
//                              {
//                                return  "N/A";
//                              }
//                              return "${model.lastName}";
//                            })(),
//
//                            style: TextStyle(fontSize: 15),
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
//                  Divider(),
//                  Container(
//                    height: 40,
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Row(
//                        children: <Widget>[
//                          Padding(
//                            padding: const EdgeInsets.only(left: 8.0),
//                            child: Image.asset('assets/images/email.png'),
//                          ),
//                          UIHelper.horizontalSpaceSmall(),
//                          Text(
//                            (() {
//                              if(model.address == null)
//                              {
//                                return  "N/A";
//                              }
//                              return "${model.email}";
//                            })(),
//
//                            style: TextStyle(fontSize: 15),
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
//                  Divider(),
//                  Container(
//                    height: 40,
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Row(
//                        children: <Widget>[
//                          Padding(
//                            padding: const EdgeInsets.only(left: 8.0),
//                            child: Image.asset('assets/images/phone.png'),
//                          ),
//                          UIHelper.horizontalSpaceSmall(),
//                          Text(
//                            (() {
//                              if(model.address == null)
//                              {
//                                return  "N/A";
//                              }
//                              return "0${model.phone}";
//                            })(),
//
//                            style: TextStyle(fontSize: 15),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                  Divider(),
//                  Container(
//                    height: 40,
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Row(
//                        children: <Widget>[
//                          Padding(
//                            padding: const EdgeInsets.only(left: 8.0),
//                            child:
//                                Image.asset('assets/images/material_home.png'),
//                          ),
//                          UIHelper.horizontalSpaceSmall(),
//                          Text(
//                            (() {
//                              if(model.address == null)
//                              {
//                                return  "N/A";
//                              }
//                              return "${model.address}";
//                            })(),
//                            style: TextStyle(fontSize: 15),
//                            textAlign: TextAlign.right,
//                            overflow: TextOverflow.clip,
//
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
//                  Divider(),
////                  Container(
////                    height: 40,
////                    child: Padding(
////                      padding: const EdgeInsets.all(8.0),
////                      child: Row(
////                        children: <Widget>[
////                          Padding(
////                            padding: const EdgeInsets.only(left: 8.0),
////                            child: Image.asset('assets/images/location.png'),
////                          ),
////                          UIHelper.horizontalSpace(30),
////                          Text(
////                            (() {
////                              if(model.address == null)
////                                {
////                               return  "N/A";
////                                }
////                               return "${model.address}";
////                            })(),
////                            style: TextStyle(fontSize: 18),
////                          )
////                        ],
////                      ),
////                    ),
////                  ),
////                  Divider(),
//                  Container(
//                    height: 40,
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Row(
//                        children: <Widget>[
//                          Padding(
//                            padding: const EdgeInsets.only(left: 8.0),
//                            child: Image.asset('assets/images/calandar.png'),
//                          ),
//                          UIHelper.horizontalSpaceSmall(),
//                          Text(
//                            (() {
//                              if(model.dob == null)
//                              {
//                                return  "N/A";
//                              }
//                              return "${model.dob}";
//                            })(),
//
//                            style: TextStyle(fontSize: 15),
//
//                          )
//                        ],
//                      ),
//                    ),
//                  ),
//                  Divider(),
//                  UIHelper.verticalSpaceLarge(),
//                  UIHelper.verticalSpaceLarge(),
//                ],
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
  }
}
