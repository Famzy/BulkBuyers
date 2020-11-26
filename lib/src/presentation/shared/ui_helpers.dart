import 'package:bulk_buyers/core/utils/theme/app_colors.dart';
import 'package:bulk_buyers/core/utils/theme/font_styles.dart';
import 'package:flutter/material.dart';

/// Contains useful functions to reduce boilerplate code
class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double _VerticalSpaceSmaller = 10.0;
  static const double _VerticalSpaceSmall = 20.0;
  static const double _VerticalSpaceMedium = 40.0;
  static const double _VerticalSpaceLarge = 60.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double _HorizontalSpaceSmall = 20.0;
  static const double _HorizontalSpaceMedium = 40.0;
  static const double HorizontalSpaceLarge = 60.0;

  /// Returns a vertical space with height set to [_VerticalSpaceSmaller]
  static Widget verticalSpaceSmaller() {
    return verticalSpace(_VerticalSpaceSmaller);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceSmall]
  static Widget verticalSpaceSmall() {
    return verticalSpace(_VerticalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceMedium]
  static Widget verticalSpaceMedium() {
    return verticalSpace(_VerticalSpaceMedium);
  }

  /// Returns a vertical space with height set to [_VerticalSpaceLarge]
  static Widget verticalSpaceLarge() {
    return verticalSpace(_VerticalSpaceLarge);
  }

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) {
    return Container(height: height);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceSmall]
  static Widget horizontalSpaceSmall() {
    return horizontalSpace(_HorizontalSpaceSmall);
  }

  /// Returns a vertical space with height set to [_HorizontalSpaceMedium]
  static Widget horizontalSpaceMedium() {
    return horizontalSpace(_HorizontalSpaceMedium);
  }

  /// Returns a vertical space with height set to [HorizontalSpaceLarge]
  static Widget horizontalSpaceLarge() {
    return horizontalSpace(HorizontalSpaceLarge);
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace(double width) {
    return Container(width: width);
  }

  /// Provides an input field with a title that stretches the full width of the screen
  static Widget inputField(
      {String title,
      String placeholder,
      @required TextEditingController controller,
      String validationMessage,
      bool isPassword = false,
      double spaceBetweenTitle = 15.0,
      double padding = 10.0}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0)),
          validationMessage != null
              ? Text(validationMessage,
                  style: TextStyle(color: Colors.red[400], fontSize: 12.0))
              : Container(),
          Container(
            alignment: Alignment(0.0, 0.0),
            padding: EdgeInsets.only(left: padding),
            margin: EdgeInsets.only(top: spaceBetweenTitle),
            width: double.infinity,
            height: 40.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0), color: lightGrey),
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              style: TextStyle(fontSize: 12.0),
              decoration: InputDecoration.collapsed(
                  hintText: placeholder,
                  hintStyle:
                      TextStyle(color: Colors.grey[600], fontSize: 12.0)),
            ),
          )
        ]);
  }

  /// Provides an input  form field with a title that stretches the full width of the screen

  static Widget inputFormField(
      {String title,
      String placeholder,
      TextInputType keyboard,
      Function action,
      IconButton icon,
      Function validator,
      @required TextEditingController controller,
      String validationMessage,
      bool isPassword = false,
      double spaceBetweenTitle = 5.0,
      double padding = 5.0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        validationMessage != null
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(validationMessage,
                    style: TextStyle(color: Colors.red[400], fontSize: 12.0)),
              )
            : Container(),
        Padding(
          padding: EdgeInsets.only(top: 1, bottom: 1),
          child: TextFormField(
            onEditingComplete: action,
            autofocus: true,
            autocorrect: false,
            maxLines: 1,
            style: formText,
            controller: controller,
            obscureText: isPassword,
            keyboardType: keyboard,
            validator: validator,
            decoration: InputDecoration(
              suffixIcon: icon,
              labelText: placeholder,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: whiteSwatch)),
            ),
          ),
        ),
      ],
    );
  }

  static Widget fullScreenButton(
      {@required String title, @required Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: primarySwatch),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  static Widget disabledButton({@required String title}) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: graySwatch),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  static Widget ScreenButton(
      {@required String title, @required Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: primarySwatch),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500, color: whiteSwatch),
          ),
        ),
      ),
    );
  }

  static Widget appLogo({BoxFit fit}) {
    return Container(
      width: 183,
      height: 87,
      margin: EdgeInsets.only(top: 28),
      child: Image.asset(
        "assets/images/img-20181004-wa0006-3.png",
        fit: fit,
      ),
    );
  }

  static Widget confirm({BoxFit fit}) {
    return Container(
      width: 183,
      height: 87,
      margin: EdgeInsets.only(top: 28),
      child: Image.asset(
        "assets/images/confirm.png",
        fit: fit,
      ),
    );
  }

  static Widget midButton({
    Color color = whiteSwatch,
    Color textColor = blackSwatch,
    @required Function onTap,
    String title,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 276,
        height: 42,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(19)),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  spreadRadius: 0)
            ],
            color: const Color(0xffffffff)),
        child: Center(
          child: Text(title,
              style: const TextStyle(
                  color: const Color(0xfffc5455),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Helvetica",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
              textAlign: TextAlign.left),
        ),
      ),
    );
  }

  static Widget midButtonGradient({Function onTap, String text}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 276,
        height: 42,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(21)),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  spreadRadius: 0)
            ],
            gradient: LinearGradient(
                begin: Alignment(0.07608816772699356, 0.658575177192688),
                end: Alignment(0.8989955186843872, 0.6693638563156128),
                colors: [const Color(0xffff9300), const Color(0xffd83a00)])),
        child: // ADD TO CART
            Center(
          child: Text(text,
              style: const TextStyle(
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                  fontFamily: "Helvetica",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
              textAlign: TextAlign.left),
        ),
      ),
    );
  }

  static Widget pageTitle({@required String title}) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 27),
            child: Text(
              title,
              style: display2,
              //  style: AppStyle.display2,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 63,
            height: 5,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: primarySwatch,
            ),
            child: Container(),
          ),
        ],
      ),
    );
  }

  static Widget formLInkText(
      {@required String title, @required Function onTap}) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: resetText,
        ),
      ),
    );
  }

  static Widget descriptionText(
      {@required String title, @required Function onTap}) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          title,
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
            color: darkSwatch,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  static GestureDetector discount({Function onTap, String title, Color color}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 124,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
          color: color,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 12, fontFamily: "Roboto", color: whiteSwatch),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }

  static Widget gradient({Function onTap, String text}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 306,
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(21)),
          boxShadow: [
            BoxShadow(
                color: const Color(0x29000000),
                offset: Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 0)
          ],
          gradient: LinearGradient(
              begin: Alignment(0.07608816772699356, 0.658575177192688),
              end: Alignment(0.8989955186843872, 0.6693638563156128),
              colors: [const Color(0xffff9300), const Color(0xffd83a00)]),
        ),
        child: Center(
          child: Text(
            "CHECKOUT NOW      | \u{20A6}$text",
            style: TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }

  static Widget shopBTN({Function onTap, String text}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280,
        height: 42,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(19)),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  spreadRadius: 0)
            ],
            color: const Color(0xffffffff)),
        child: Center(
          child: Text(
            text,
          ),
        ),
      ),
    );
  }
}

Widget dismiss(
    {@required String key,
    @required Widget child,
    @required Function onSwipe}) {
  return Dismissible(
      onDismissed: onSwipe,
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete_sweep,
          color: whiteSwatch,
        ),
      ),
      key: Key(key),
      child: child);
}
