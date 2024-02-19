import 'package:get/get.dart';
import 'package:transmedia/data/data_sources/local/sqlite_data_service.dart';
import 'package:transmedia/domain/entities/product_entity.dart';
import 'package:transmedia/domain/use_cases/product_use_case.dart';


class HomeController extends GetxController {
  //TODO: Implement HomeController
  final ProductsUseCase _getProductsUseCase;

  HomeController(this._getProductsUseCase);

  final productList = <ProductEntity>[].obs;
  final productListForFilter = <ProductEntity>[].obs;
  final productLoaded=false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {

    final result = await _getProductsUseCase.getProductsUseCase();

    result.fold((failure) {}, (products) {
      productList.assignAll(products);
      productListForFilter.assignAll(products);
      productLoaded.value=true;
    });
  }



  searchByKey(String key) {
    List<ProductEntity> products = List.from(productList);

    if (key.isNotEmpty) {
      List<ProductEntity> filteredProductList = [];

      for (ProductEntity item in products) {
        String name = item.title ?? '';
        if (name.toLowerCase().contains(key.toLowerCase())) {
          filteredProductList.add(item);
        }
      }

      productList.value = filteredProductList;
    } else {
      productList.assignAll(productListForFilter);
    }
  }



}
