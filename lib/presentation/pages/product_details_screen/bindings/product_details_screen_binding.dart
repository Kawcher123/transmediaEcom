import 'package:get/get.dart';
import 'package:transmedia/injections/dependency_injection.dart';

import '../controllers/product_details_screen_controller.dart';

class ProductDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsScreenController>(
      () => ProductDetailsScreenController(DependencyInjection.getIt()),
    );
  }
}
