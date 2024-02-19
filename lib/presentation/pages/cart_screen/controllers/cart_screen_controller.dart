import 'package:get/get.dart';
import 'package:transmedia/domain/entities/cart_entity.dart';
import 'package:transmedia/domain/use_cases/cart_use_case.dart';
import 'package:transmedia/presentation/common/ui.dart';
import 'package:transmedia/presentation/pages/environment_screen/controllers/environment_screen_controller.dart';

class CartScreenController extends GetxController {
  //TODO: Implement CartScreenController

  final CartUseCase _cartUseCase;

  CartScreenController(this._cartUseCase);

  final cartList = <CartEntity>[].obs;
  final cartLoaded = false.obs;
  @override
  void onInit() {
    super.onInit();
    getCartList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getCartList() async {
    final result = await _cartUseCase.getCartListUseCase();

    result.fold((failure) {}, (cart) {
      print('ProductDetailsScreenController.get cart list:$cart');

      cartList.assignAll(cart);
      Get.find<EnvironmentScreenController>().cartCount.value = cartList.length;
      cartLoaded.value = true;
    });
  }

  Future updateCartItem(CartEntity cartEntity) async {
    Ui.commonUi.customDialogLoader();
    final result = await _cartUseCase.updateCartUseCase(cartEntity);

    result.fold((failure) {}, (cart) {
      print('ProductDetailsScreenController.get cart list:$cart');
      cartList.assignAll(cart);
      Get.find<EnvironmentScreenController>().cartCount.value = cartList.length;
      Get.back();
    });
  }

  Future deleteCartItem(CartEntity cartEntity) async {
    final result = await _cartUseCase.deleteFromCartUseCase(cartEntity);

    result.fold((failure) {}, (cart) {
      print('ProductDetailsScreenController.get cart list:$cart');

      cartList.assignAll(cart);
      Get.find<EnvironmentScreenController>().cartCount.value = cartList.length;
      Get.back();
    });
  }

  void quantityIncrement() {}

  void quantityDecrement() {}
}
