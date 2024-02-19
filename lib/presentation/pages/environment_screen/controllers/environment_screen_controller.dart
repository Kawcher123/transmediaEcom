import 'package:get/get.dart';
import 'package:transmedia/domain/use_cases/cart_use_case.dart';

class EnvironmentScreenController extends GetxController {
  //TODO: Implement EnvironmentScreenController

  final CartUseCase _cartUseCase;

  EnvironmentScreenController(this._cartUseCase);

  final cartCount = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getCartLength();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getCartLength() async {
    var result = await _cartUseCase.getCartLengthUseCase();
    result.fold((failure) {}, (cartLength) {
      print('ProductDetailsScreenController.cart length:$cartLength');
     cartCount.value=cartLength;
    });
  }
}
