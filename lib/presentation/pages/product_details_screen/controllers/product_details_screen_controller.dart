import 'package:get/get.dart';
import 'package:transmedia/domain/entities/cart_entity.dart';
import 'package:transmedia/domain/entities/product_entity.dart';
import 'package:transmedia/domain/extensions/Product_entity_extension.dart';
import 'package:transmedia/domain/failures/failures.dart';
import 'package:transmedia/domain/use_cases/cart_use_case.dart';
import 'package:transmedia/presentation/common/ui.dart';
import 'package:transmedia/presentation/pages/environment_screen/controllers/environment_screen_controller.dart';

class ProductDetailsScreenController extends GetxController {
  //TODO: Implement ProductDetailsScreenController
  final CartUseCase _cartUseCase;

  ProductDetailsScreenController(this._cartUseCase);
  final productDetails = ProductEntity().obs;
  final cartQuantity = 1.obs;
  @override
  void onInit() {
    super.onInit();
    productDetails.value = Get.arguments;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void quantityIncrement() {
    cartQuantity.value += 1;
  }

  void quantityDecrement() {
    if (cartQuantity.value > 1) {
      cartQuantity.value -= 1;
    }
  }

  Future<void> addToCart() async {
    Ui.commonUi.customDialogLoader();
    CartEntity cartEntity=productDetails.value.toCartEntity(cartQuantity.value);
    final result = await _cartUseCase.addToCartUseCase(cartEntity);

    result.fold((failure) {
      print('ProductDetailsScreenController.addToCart:${failure}');
      Get.back();
      if(failure.runtimeType==DuplicateRowDatabaseFailure)
        {
          Ui.commonUi.showAwesomeDialog('Error', ('This product is already in your cart list'), Get.theme.primaryColor, () {
            Get.back();
          }, Get.context,type: 'error');
        }
    }, (cart) async {
      print('ProductDetailsScreenController.addToCart:$cart');
      await Get.find<EnvironmentScreenController>().getCartLength();
      Get.back();
      Ui.commonUi.showAwesomeDialog('Success', ('Product added successfully.'), Get.theme.primaryColor, () {
        Get.back();
      }, Get.context,type: 'success');
    });
  }
}
