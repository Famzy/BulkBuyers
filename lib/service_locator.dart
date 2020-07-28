import 'package:bulk_buyers/src/scoped_models/authenticated_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/checkout/cart_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/store/categories_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/auth/forgot_password_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/framework_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/auth/login_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/checkout/order_details_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/checkout/orders_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/checkout/payment_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/store/product_details_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/store/product_grid_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/user/profile_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/store/shop_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/auth/sign_up_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/welcome_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/checkout/wish_list_view_model.dart';
import 'package:bulk_buyers/src/scoped_models/user/you_view_model.dart';
import 'package:bulk_buyers/src/services/dynamic_links_services.dart';
import 'package:bulk_buyers/src/services/storage_service.dart';
import 'package:get_it/get_it.dart';
GetIt locator = new GetIt();

void setupLocator() {
  // Register services
  locator.registerLazySingleton<StorageService>(() => StorageService());
  locator.registerLazySingleton(() => DynamicLinksService());
  // Register ScopedModels
  locator.registerFactory<WelcomeViewModel>(() => WelcomeViewModel());
  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
  locator.registerFactory<SignUpViewModel>(() => SignUpViewModel());
  locator.registerFactory<ForgotPasswordViewModel>(() => ForgotPasswordViewModel());
  locator.registerFactory<FrameworkViewModel>(() => FrameworkViewModel());
  locator.registerFactory<AuthenticatedViewModel>(() => AuthenticatedViewModel());
  locator.registerFactory<ShopViewModel>(() => ShopViewModel());
  locator.registerFactory<ProductGridViewModel>(() => ProductGridViewModel());
  locator.registerFactory<ProductDetailsViewModel>(() => ProductDetailsViewModel());
  locator.registerFactory<CartViewModel>(() => CartViewModel());
  locator.registerFactory<WishListViewModel>(() => WishListViewModel());
  locator.registerFactory<YouViewModel>(() => YouViewModel());
  locator.registerFactory<ProfileViewModel>(() => ProfileViewModel());
  locator.registerFactory<PaymentViewModel>(() => PaymentViewModel());
  locator.registerFactory<OrdersViewModel>(() => OrdersViewModel());
  locator.registerFactory<OrderDetailsViewModel>(() => OrderDetailsViewModel());
  locator.registerFactory<CategoriesViewModel>(() => CategoriesViewModel());
}

