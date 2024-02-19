import 'package:get/get.dart';
import 'package:transmedia/injections/dependency_injection.dart';
import 'package:transmedia/presentation/pages/home/bindings/home.binding.dart';

import '../controllers/environment_screen_controller.dart';

class EnvironmentScreenBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<EnvironmentScreenController>(
      () => EnvironmentScreenController(DependencyInjection.getIt()),
    );
    HomeControllerBinding().dependencies();
  }
}
