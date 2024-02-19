
import 'package:transmedia/data/models/product_model.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductModel>> getAllProductsFromApi();
}

