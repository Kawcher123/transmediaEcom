
import 'package:get/get.dart';
import 'package:transmedia/presentation/pages/cart_screen/bindings/cart_screen_binding.dart';
import 'package:transmedia/presentation/pages/cart_screen/views/cart_screen_view.dart';
import 'package:transmedia/presentation/pages/environment_screen/bindings/environment_screen_binding.dart';
import 'package:transmedia/presentation/pages/environment_screen/views/environment_screen_view.dart';
import 'package:transmedia/presentation/pages/home/bindings/home.binding.dart';
import 'package:transmedia/presentation/pages/home/view/home.screen.dart';
import 'package:transmedia/presentation/pages/product_details_screen/bindings/product_details_screen_binding.dart';
import 'package:transmedia/presentation/pages/product_details_screen/views/product_details_screen_view.dart';

import 'routes.dart';


class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),

    GetPage(
      name: Routes.ENVCLASS,
      page: () => const EnvironmentScreenView(),
      binding:EnvironmentScreenBinding()
    ),

    GetPage(
      name: Routes.PRODUCT_DETAILS_SCREEN,
      page: () => const ProductDetailsScreenView(),
      binding: ProductDetailsScreenBinding(),
    ),
    GetPage(
      name: Routes.CART_SCREEN,
      page: () => const CartScreenView(),
      binding: CartScreenBinding(),
    ),

    GetPage(
      name: Routes.ENVIRONMENT_SCREEN,
      page: () => const EnvironmentScreenView(),
      binding: EnvironmentScreenBinding(),
    ),
  ];
}
