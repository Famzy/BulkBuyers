import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfileView extends StatefulWidget {
  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  TextEditingController fnameControler = TextEditingController();
  TextEditingController lnameControler = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  TextEditingController phoneControler = TextEditingController();
  TextEditingController addressControler = TextEditingController();
  TextEditingController dateController = TextEditingController();

//  showCartSnak(String msg, bool flag) {
//    _scaffoldKey.currentState.showSnackBar(SnackBar(
//      content: Text(
//        msg,
//        style: TextStyle(color: Colors.white),
//      ),
//      backgroundColor: (flag) ? primarySwatch : Colors.red[500],
//      action: SnackBarAction(
//          label: 'undo',
//          textColor: whiteSwatch,
//          onPressed: () {
//            print("test");
//          }),
//      duration: Duration(seconds: 2),
//    ));
//  }

  @override
  Widget build(BuildContext context) {
//    return BaseView<ProfileViewModel>(
//      onModelReady: (model) => model.loadUserDetails(),
//      builder: (context, child, model) => Scaffold(
//        key: _scaffoldKey,
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
//          margin: EdgeInsets.only(bottom: 10.0),
//          decoration: BoxDecoration(
//            color: whiteSwatch,
//            borderRadius: BorderRadius.only(
//              bottomLeft: Radius.circular(20.0),
//              bottomRight: Radius.circular(20.0),
//            ),
//          ),
//          child: SafeArea(
//            child: Column(
//              children: <Widget>[
//                Container(
//                  decoration: BoxDecoration(
//                    color: blueGradient,
//                  ),
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Text(
//                          "EDIT PROFILE DETAILS",
//                          style: subHeading4,
//                        ),
//                        Image.asset('assets/images/edit.png')
//                      ],
//                    ),
//                  ),
//                ),
//                UIHelper.verticalSpaceLarge(),
//                Container(
//                  height: 50,
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Row(
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.only(left: 8.0),
//                          child: SvgPicture.asset('assets/svgs/user.svg'),
//                        ),
//                        UIHelper.horizontalSpaceSmall(),
//                        Expanded(
//                          child: TextFormField(
//                            controller: fnameControler,
//                            decoration: InputDecoration(
//                              contentPadding:
//                                  EdgeInsets.only(bottom: -5, left: 10),
//                              hintText: "${model.firstName}",
//                              border: OutlineInputBorder(),
//                            ),
//                          ),
//                        )
//                      ],
//                    ),
//                  ),
//                ),
//                Container(
//                  height: 50,
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Row(
//                      children: <Widget>[
//                        Padding(
//                            padding: const EdgeInsets.only(left: 8.0),
//                            child:
//                                SvgPicture.asset('assets/svgs/user_tie.svg')),
//                        UIHelper.horizontalSpaceSmall(),
//                        Expanded(
//                          child: TextFormField(
//                            decoration: InputDecoration(
//                              contentPadding:
//                                  EdgeInsets.only(bottom: -5, left: 10),
//                              hintText: "${model.lastName}",
//                              border: OutlineInputBorder(),
//                            ),
//                            controller: lnameControler,
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//                Container(
//                  height: 50,
//                  child: Padding(
//                    padding: const EdgeInsets.symmetric(
//                        vertical: 8.0, horizontal: 8.0),
//                    child: Row(
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.only(left: 8.0),
//                          child: Image.asset('assets/images/material_home.png'),
//                        ),
//                        UIHelper.horizontalSpaceSmall(),
//                        Expanded(
//                          child: TextFormField(
//                            decoration: InputDecoration(
//                              contentPadding:
//                                  EdgeInsets.only(bottom: -5, left: 10),
//                              hintText: "${model.address}",
//                              border: OutlineInputBorder(),
//                            ),
//                            controller: addressControler,
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//                Container(
//                  height: 50,
//                  child: Padding(
//                    padding: const EdgeInsets.symmetric(
//                        vertical: 8.0, horizontal: 8.0),
//                    child: Row(
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.only(left: 8.0),
//                          child: Image.asset(
//                            'assets/images/calandar.png',
//                            scale: 2,
//                          ),
//                        ),
//                        UIHelper.horizontalSpaceSmall(),
//                        Expanded(
//                          child: TextFormField(
//                            keyboardType: TextInputType.number,
//                            inputFormatters: [
//                              WhitelistingTextInputFormatter.digitsOnly,
//                              new LengthLimitingTextInputFormatter(6),
//                              new MonthInputFormatter()
//                            ],
//                            decoration: InputDecoration(
//                              contentPadding:
//                                  EdgeInsets.only(bottom: -5, left: 10),
//                              hintText: "DD-MM-YY",
//                              border: OutlineInputBorder(),
//                            ),
//                            controller: dateController,
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
//                UIHelper.verticalSpaceMedium(),
//                Align(
//                  alignment: Alignment.topCenter,
//                  child: Container(
//                    width: 300,
//                    height: 40,
//                    margin: EdgeInsets.only(bottom: 20),
//                    child: RaisedButton(
//                      onPressed: () {
//                        model.updateUserDetails(
//                            fnameControler.text,
//                            lnameControler.text,
//                            addressControler.text,
//                            dateController.text);
//                        Timer(Duration(milliseconds: 500), () {
//                          showCartSnak(model.updateMsg, model.isSuccessful);
//                        });
//                        Navigator.push(
//                            context,
//                            PageRouteBuilder(
//                                transitionDuration:
//                                    const Duration(milliseconds: 350),
//                                pageBuilder: (context, _, __) =>
//                                    ProfileView()));
//                      },
//                      color: blackSwatch,
//                      shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.all(Radius.circular(25)),
//                      ),
//                      textColor: Color.fromARGB(255, 0, 0, 0),
//                      padding: EdgeInsets.all(8.0),
//                      child: Text(
//                        "SAVE PROFILE",
//                        style: TextStyle(
//                            fontSize: 12,
//                            fontFamily: "Roboto",
//                            color: whiteSwatch),
//                        textAlign: TextAlign.left,
//                      ),
//                    ),
//                  ),
//                )
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
  }
}
