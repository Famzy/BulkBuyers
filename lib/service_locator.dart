import 'dart:io';

import 'package:bulk_buyers/src/data/datasource/local/local_data_source_impl.dart';
import 'package:bulk_buyers/src/data/datasource/local/local_data_source.dart';
import 'package:bulk_buyers/src/domain/usecase/auth_usecase.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' show Client;
import 'core/network/network_info.dart';
import 'core/services/dynamic_links_services.dart';
import 'core/services/storage_service.dart';
import 'src/data/datasource/remote/remote_data_source.dart';
import 'src/data/repository/repository_impl.dart';
import 'src/domain/repository/repository.dart';
import 'src/domain/usecase/categories_usecase.dart';
import 'src/domain/usecase/products_usecase.dart';
import 'src/presentation/scoped_models/auth/forgot_password_view_model.dart';
import 'src/presentation/scoped_models/auth/login_view_model.dart';
import 'src/presentation/scoped_models/auth/sign_up_view_model.dart';
import 'src/presentation/scoped_models/authenticated_view_model.dart';
import 'src/presentation/scoped_models/checkout/cart_view_model.dart';
import 'src/presentation/scoped_models/checkout/order_details_view_model.dart';
import 'src/presentation/scoped_models/checkout/orders_view_model.dart';
import 'src/presentation/scoped_models/checkout/payment_view_model.dart';
import 'src/presentation/scoped_models/checkout/wish_list_view_model.dart';
import 'src/presentation/scoped_models/framework_view_model.dart';
import 'src/presentation/scoped_models/store/categories_view_model.dart';
import 'src/presentation/scoped_models/store/product_details_view_model.dart';
import 'src/presentation/scoped_models/store/product_grid_view_model.dart';
import 'src/presentation/scoped_models/store/shop_view_model.dart';
import 'src/presentation/scoped_models/user/profile_view_model.dart';
import 'src/presentation/scoped_models/user/you_view_model.dart';
import 'src/presentation/scoped_models/welcome_view_model.dart';

GetIt di = new GetIt();
Client client = Client();
void setupLocator() async {
  // Register services
  services();
  //! Core Stuffs
  core();
  // Repository
  repo();
  // ! Features - Use Cases
  usecase();
  //Data sources
  datasource();
  //! External Dependencies
  dependencies();
  // Register ScopedModels
  initScopedModels();
}

void initScopedModels() {
//   Register ScopedModels
  di.registerFactory<WelcomeViewModel>(() => WelcomeViewModel());
  di.registerFactory<LoginViewModel>(() => LoginViewModel(auth: di()));
  di.registerFactory<SignUpViewModel>(() => SignUpViewModel(auth: di()));
  di.registerFactory<ForgotPasswordViewModel>(
      () => ForgotPasswordViewModel(auth: di()));
  di.registerFactory<FrameworkViewModel>(() => FrameworkViewModel());
  di.registerFactory<AuthenticatedViewModel>(() => AuthenticatedViewModel());
  di.registerFactory<ShopViewModel>(() => ShopViewModel());
  di.registerFactory<ProductGridViewModel>(() => ProductGridViewModel());
  di.registerFactory<ProductDetailsViewModel>(() => ProductDetailsViewModel());
  di.registerFactory<CartViewModel>(() => CartViewModel());
  di.registerFactory<WishListViewModel>(() => WishListViewModel());
  di.registerFactory<YouViewModel>(() => YouViewModel());
  di.registerFactory<ProfileViewModel>(() => ProfileViewModel());
  di.registerFactory<PaymentViewModel>(() => PaymentViewModel());
  di.registerFactory<OrdersViewModel>(() => OrdersViewModel());
  di.registerFactory<OrderDetailsViewModel>(() => OrderDetailsViewModel());
  di.registerFactory<CategoriesViewModel>(
      () => CategoriesViewModel(category: di(), products: di()));
}

void services() {
  di.registerLazySingleton<StorageService>(() => StorageService());
  di.registerLazySingleton(() => DynamicLinksService());
}

void core() {
  di.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(di()));
}

void dependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  di.registerLazySingleton(() => sharedPreferences);
  di.registerLazySingleton(() => Sqflite());
  di.registerLazySingleton(() => client);
  di.registerLazySingleton(() => HttpClient());
  di.registerLazySingleton(() => DataConnectionChecker());
}

void datasource() {
  di.registerLazySingleton<RemoteData>(() => RemoteDataImpl(client: di()));
  di.registerLazySingleton<LocalData>(
      () => LocalDataImpl(sharedPreferences: di()));
}

void repo() {
  di.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      localData: di(),
      networkInfo: di(),
      remoteData: di(),
      sharedPreferences: di(),
    ),
  );
}

void usecase() {
  di.registerLazySingleton(() => CategoriesUC(di()));
  di.registerLazySingleton(() => ProductsUC(di()));
  di.registerLazySingleton(() => AuthUC(di()));
}
