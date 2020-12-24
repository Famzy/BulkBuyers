// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:bulk_buyers/src/presentation/views/home_view.dart';
import 'package:bulk_buyers/src/home_container.dart';
import 'package:bulk_buyers/src/presentation/views/auth/login_view.dart';
import 'package:bulk_buyers/src/presentation/views/auth/forgot_password_view.dart';
import 'package:bulk_buyers/src/presentation/views/auth/sign_up_view.dart';
import 'package:bulk_buyers/src/presentation/views/auth/verify_email_view.dart';
import 'package:bulk_buyers/src/presentation/views/checkout/paymet_confirmation.dart';
import 'package:bulk_buyers/src/presentation/views/checkout/cart_view.dart';
import 'package:bulk_buyers/src/presentation/views/checkout/order_details_view.dart';
import 'package:bulk_buyers/src/presentation/views/checkout/orders_view.dart';
import 'package:bulk_buyers/src/presentation/views/checkout/payment_view.dart';
import 'package:bulk_buyers/src/presentation/views/checkout/wish_list_view.dart';
import 'package:bulk_buyers/src/presentation/views/store/categories_view.dart';
import 'package:bulk_buyers/src/presentation/views/store/product_details_view.dart';
import 'package:bulk_buyers/src/presentation/views/store/product_grid_view.dart';
import 'package:bulk_buyers/src/presentation/views/store/product_list_view.dart';
import 'package:bulk_buyers/src/presentation/views/store/shop_view.dart';
import 'package:bulk_buyers/src/presentation/views/user/edit_profile_view.dart';
import 'package:bulk_buyers/src/presentation/views/user/profile_view.dart';
import 'package:bulk_buyers/src/presentation/views/user/you_view.dart';
import 'package:bulk_buyers/src/presentation/views/about_view.dart';
import 'package:bulk_buyers/src/presentation/views/authenticated_view.dart';
import 'package:bulk_buyers/src/presentation/views/faq.dart';
import 'package:bulk_buyers/src/presentation/views/how_it_works_view.dart';
import 'package:bulk_buyers/src/presentation/views/network_splash_screen.dart';
import 'package:bulk_buyers/src/presentation/views/welcome_view.dart';
import 'package:bulk_buyers/src/presentation/views/auth/password_rest_confirmation_view.dart';
import 'package:bulk_buyers/src/presentation/no_internet_view.dart';
import 'package:bulk_buyers/src/presentation/views/checkout/wishList_tb.dart';
import 'package:bulk_buyers/src/presentation/views/user/profile_topbar.dart';

class Router {
  static const home = '/';
  static const container = '/container';
  static const loginView = '/login-view';
  static const forgotPassword = '/forgot-password';
  static const signUp = '/sign-up';
  static const verifyEmail = '/verify-email';
  static const paymentConfiramtion = '/payment-confiramtion';
  static const cartView = '/cart-view';
  static const orderDetails = '/order-details';
  static const orders = '/orders';
  static const payment = '/payment';
  static const wishList = '/wish-list';
  static const categories = '/categories';
  static const productDetails = '/product-details';
  static const productGrid = '/product-grid';
  static const productList = '/product-list';
  static const shopView = '/shop-view';
  static const editProfile = '/edit-profile';
  static const profile = '/profile';
  static const you = '/you';
  static const about = '/about';
  static const authenticated = '/authenticated';
  static const faQs = '/fa-qs';
  static const howItWorks = '/how-it-works';
  static const networkSplashScreen = '/network-splash-screen';
  static const welcome = '/welcome';
  static const resetConfrimation = '/reset-confrimation';
  static const noInternet = '/no-internet';
  static const wishListViewTB = '/wish-list-view-tB';
  static const profileViewTB = '/profile-view-tB';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.home:
        return MaterialPageRoute(
          builder: (_) => HomeView(),
          settings: settings,
        );
      case Router.container:
        return MaterialPageRoute(
          builder: (_) => HomeContainer(),
          settings: settings,
        );
      case Router.loginView:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
          settings: settings,
        );
      case Router.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordView(),
          settings: settings,
        );
      case Router.signUp:
        return MaterialPageRoute(
          builder: (_) => SignUpView(),
          settings: settings,
        );
      case Router.verifyEmail:
        return MaterialPageRoute(
          builder: (_) => VerifyEmail(),
          settings: settings,
        );
      case Router.paymentConfiramtion:
        if (hasInvalidArgs<PaymentConfiramtionArguments>(args)) {
          return misTypedArgsRoute<PaymentConfiramtionArguments>(args);
        }
        final typedArgs = args as PaymentConfiramtionArguments ??
            PaymentConfiramtionArguments();
        return MaterialPageRoute(
          builder: (_) => PaymentConfiramtion(
              ref: typedArgs.ref,
              orderid: typedArgs.orderid,
              totalcost: typedArgs.totalcost),
          settings: settings,
          fullscreenDialog: true,
        );
      case Router.cartView:
        return MaterialPageRoute(
          builder: (_) => CartView(),
          settings: settings,
        );
      case Router.orderDetails:
        if (hasInvalidArgs<OrderDetailsViewArguments>(args)) {
          return misTypedArgsRoute<OrderDetailsViewArguments>(args);
        }
        final typedArgs =
            args as OrderDetailsViewArguments ?? OrderDetailsViewArguments();
        return MaterialPageRoute(
          builder: (_) => OrderDetailsView(
              id: typedArgs.id,
              ref: typedArgs.ref,
              status: typedArgs.status,
              date: typedArgs.date,
              total: typedArgs.total,
              discount: typedArgs.discount),
          settings: settings,
        );
      case Router.orders:
        return MaterialPageRoute(
          builder: (_) => OrdersView(),
          settings: settings,
        );
      case Router.payment:
        if (hasInvalidArgs<PaymentViewArguments>(args)) {
          return misTypedArgsRoute<PaymentViewArguments>(args);
        }
        final typedArgs =
            args as PaymentViewArguments ?? PaymentViewArguments();
        return MaterialPageRoute(
          builder: (_) => PaymentView(
              total: typedArgs.total,
              discountid: typedArgs.discountid,
              discount: typedArgs.discount),
          settings: settings,
        );
      case Router.wishList:
        return MaterialPageRoute(
          builder: (_) => WishListView(),
          settings: settings,
        );
      case Router.categories:
        return MaterialPageRoute(
          builder: (_) => CategoriesView(),
          settings: settings,
        );
      case Router.productDetails:
        if (hasInvalidArgs<ProductDetailsViewArguments>(args)) {
          return misTypedArgsRoute<ProductDetailsViewArguments>(args);
        }
        final typedArgs = args as ProductDetailsViewArguments ??
            ProductDetailsViewArguments();
        return MaterialPageRoute(
          builder: (_) => ProductDetailsView(
              id: typedArgs.id,
              name: typedArgs.name,
              price: typedArgs.price,
              quantity: typedArgs.quantity,
              image: typedArgs.image,
              discount: typedArgs.discount),
          settings: settings,
          fullscreenDialog: true,
        );
      case Router.productGrid:
        return MaterialPageRoute(
          builder: (_) => ProductGridView(),
          settings: settings,
        );
      case Router.productList:
        if (hasInvalidArgs<ProductListViewArguments>(args)) {
          return misTypedArgsRoute<ProductListViewArguments>(args);
        }
        final typedArgs =
            args as ProductListViewArguments ?? ProductListViewArguments();
        return MaterialPageRoute(
          builder: (_) => ProductListView(
              key: typedArgs.key,
              name: typedArgs.name,
              categoryId: typedArgs.categoryId),
          settings: settings,
        );
      case Router.shopView:
        return MaterialPageRoute(
          builder: (_) => ShopView(),
          settings: settings,
        );
      case Router.editProfile:
        return MaterialPageRoute(
          builder: (_) => EditProfileView(),
          settings: settings,
        );
      case Router.profile:
        return MaterialPageRoute(
          builder: (_) => ProfileView(),
          settings: settings,
        );
      case Router.you:
        return MaterialPageRoute(
          builder: (_) => YouView(),
          settings: settings,
        );
      case Router.about:
        return MaterialPageRoute(
          builder: (_) => About(),
          settings: settings,
        );
      case Router.authenticated:
        return MaterialPageRoute(
          builder: (_) => AuthenticatedView(),
          settings: settings,
        );
      case Router.faQs:
        return MaterialPageRoute(
          builder: (_) => FAQs(),
          settings: settings,
        );
      case Router.howItWorks:
        return MaterialPageRoute(
          builder: (_) => HowItWorks(),
          settings: settings,
        );
      case Router.networkSplashScreen:
        return MaterialPageRoute(
          builder: (_) => NetworkSplashScreen(),
          settings: settings,
        );
      case Router.welcome:
        return MaterialPageRoute(
          builder: (_) => WelcomeView(),
          settings: settings,
        );
      case Router.resetConfrimation:
        return MaterialPageRoute(
          builder: (_) => ResetConfrimation(),
          settings: settings,
        );
      case Router.noInternet:
        return MaterialPageRoute(
          builder: (_) => NoInternetView(),
          settings: settings,
        );
      case Router.wishListViewTB:
        return MaterialPageRoute(
          builder: (_) => WishListViewTB(),
          settings: settings,
        );
      case Router.profileViewTB:
        return MaterialPageRoute(
          builder: (_) => ProfileViewTB(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//PaymentConfiramtion arguments holder class
class PaymentConfiramtionArguments {
  final String ref;
  final int orderid;
  final int totalcost;
  PaymentConfiramtionArguments({this.ref, this.orderid, this.totalcost});
}

//OrderDetailsView arguments holder class
class OrderDetailsViewArguments {
  final int id;
  final String ref;
  final int status;
  final String date;
  final double total;
  final double discount;
  OrderDetailsViewArguments(
      {this.id, this.ref, this.status, this.date, this.total, this.discount});
}

//PaymentView arguments holder class
class PaymentViewArguments {
  final int total;
  final int discountid;
  final int discount;
  PaymentViewArguments({this.total, this.discountid, this.discount});
}

//ProductDetailsView arguments holder class
class ProductDetailsViewArguments {
  final int id;
  final String name;
  final int price;
  final int quantity;
  final String image;
  final int discount;
  ProductDetailsViewArguments(
      {this.id,
      this.name,
      this.price,
      this.quantity,
      this.image,
      this.discount});
}

//ProductListView arguments holder class
class ProductListViewArguments {
  final Key key;
  final String name;
  final int categoryId;
  ProductListViewArguments({this.key, this.name, this.categoryId});
}
