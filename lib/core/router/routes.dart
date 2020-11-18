import 'package:auto_route/auto_route_annotations.dart';
import 'package:bulk_buyers/src/presentation/views/about_view.dart';
import 'package:bulk_buyers/src/presentation/views/auth/forgot_password_view.dart';
import 'package:bulk_buyers/src/presentation/views/auth/login_view.dart';
import 'package:bulk_buyers/src/presentation/views/auth/password_rest_confirmation_view.dart';
import 'package:bulk_buyers/src/presentation/views/auth/sign_up_view.dart';
import 'package:bulk_buyers/src/presentation/views/auth/verify_email_view.dart';
import 'package:bulk_buyers/src/presentation/views/authenticated_view.dart';
import 'package:bulk_buyers/src/presentation/views/checkout/cart_view.dart';
import 'package:bulk_buyers/src/presentation/views/checkout/order_details_view.dart';
import 'package:bulk_buyers/src/presentation/views/checkout/orders_view.dart';
import 'package:bulk_buyers/src/presentation/views/checkout/payment_view.dart';
import 'package:bulk_buyers/src/presentation/views/checkout/paymet_confirmation.dart';
import 'package:bulk_buyers/src/presentation/views/checkout/wish_list_view.dart';
import 'package:bulk_buyers/src/presentation/views/faq.dart';
import 'package:bulk_buyers/src/presentation/views/home_view.dart';
import 'package:bulk_buyers/src/presentation/views/how_it_works_view.dart';
import 'package:bulk_buyers/src/presentation/views/network_splash_screen.dart';
import 'package:bulk_buyers/src/presentation/views/store/categories_view.dart';
import 'package:bulk_buyers/src/presentation/views/store/product_details_view.dart';
import 'package:bulk_buyers/src/presentation/views/store/product_grid_view.dart';
import 'package:bulk_buyers/src/presentation/views/store/product_list_view.dart';
import 'package:bulk_buyers/src/presentation/views/store/shop_view.dart';
import 'package:bulk_buyers/src/presentation/views/user/edit_profile_view.dart';
import 'package:bulk_buyers/src/presentation/views/user/profile_view.dart';
import 'package:bulk_buyers/src/presentation/views/user/you_view.dart';
import 'package:bulk_buyers/src/presentation/views/welcome_view.dart';

@autoRouter
class $Router {
  @initial
  HomeView home;
  LoginView loginView;
  ForgotPasswordView forgotPassword;
  SignUpView signUp;
  VerifyEmail verifyEmail;
  PaymentConfiramtion paymentConfiramtion;
  CartView cartView;
  OrderDetailsView orderDetails;
  OrdersView orders;
  PaymentView payment;
  WishListView wishList;
  CategoriesView categories;
  ProductDetailsView productDetails;
  ProductGridView productGrid;
  ProductListView productList;
  ShopView shopView;
  EditProfileView editProfile;
  ProfileView profile;
  YouView you;
  About about;
  AuthenticatedView authenticated;
  FAQs faQs;
  HowItWorks howItWorks;
  NetworkSplashScreen networkSplashScreen;
  WelcomeView welcome;
  ResetConfrimation resetConfrimation;
}
