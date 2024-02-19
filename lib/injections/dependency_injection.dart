
import 'package:get_it/get_it.dart';
import 'package:transmedia/data/data_sources/api/api_manager.dart';
import 'package:transmedia/data/data_sources/local/cart_data_source.dart';
import 'package:transmedia/data/data_sources/local/cart_data_source_impl.dart';
import 'package:transmedia/data/data_sources/local/sqlite_data_service.dart';
import 'package:transmedia/data/data_sources/remote/products_data_source_impl.dart';
import 'package:transmedia/data/repositories/cart_repo_impl.dart';
import 'package:transmedia/data/repositories/product_repo_impl.dart';
import 'package:transmedia/domain/repositories/cart_repository.dart';
import 'package:transmedia/domain/repositories/product_repository.dart';
import 'package:transmedia/domain/use_cases/cart_use_case.dart';
import 'package:transmedia/domain/use_cases/product_use_case.dart';
import 'package:transmedia/presentation/pages/cart_screen/controllers/cart_screen_controller.dart';
import 'package:transmedia/presentation/pages/environment_screen/controllers/environment_screen_controller.dart';
import 'package:transmedia/presentation/pages/home/controllers/home.controller.dart';
import 'package:http/http.dart' as http;
import 'package:transmedia/presentation/pages/product_details_screen/controllers/product_details_screen_controller.dart';
class DependencyInjection {
  static final GetIt getIt = GetIt.instance;

  static Future<void> init() async{

    // ! externs
    getIt.registerFactory(() => http.Client());


    // Register dependencies here

    getIt.registerLazySingleton<APIManager>(() => APIManager(getIt()));


    //getIt.registerFactory<ProductRemoteDatasource>(() => ProductRemoteDatasourceImpl(getIt()));

    getIt.registerLazySingleton<ProductRemoteDatasourceImpl>(() => ProductRemoteDatasourceImpl(getIt()));

    getIt.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(getIt()));
    getIt.registerLazySingleton<ProductsUseCase>(() => ProductsUseCase(getIt()));
    getIt.registerLazySingleton<CartRepository>(() => CartRepoImpl(getIt()));
    getIt.registerLazySingleton<CartLocalDatasourceImpl>(() => CartLocalDatasourceImpl());
    getIt.registerLazySingleton<CartUseCase>(() => CartUseCase(getIt()));
    getIt.registerLazySingleton<EnvironmentScreenController>(() => EnvironmentScreenController(getIt()));
    getIt.registerLazySingleton<HomeController>(() => HomeController(getIt()));
    getIt.registerLazySingleton<CartScreenController>(() => CartScreenController(getIt()));
    getIt.registerLazySingleton<ProductDetailsScreenController>(() => ProductDetailsScreenController(getIt()));




  }
}
