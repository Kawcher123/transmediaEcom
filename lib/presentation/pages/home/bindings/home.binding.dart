import 'package:get/get.dart';
import 'package:transmedia/injections/dependency_injection.dart';
import '../controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(DependencyInjection.getIt()));
  }
}
