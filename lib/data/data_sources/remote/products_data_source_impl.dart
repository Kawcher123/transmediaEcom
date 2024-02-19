import 'package:flutter/material.dart';
import 'package:transmedia/data/data_sources/api/api_manager.dart';
import 'package:transmedia/data/data_sources/api/api_url.dart';
import 'package:transmedia/data/data_sources/remote/products_data_source.dart';
import 'package:transmedia/data/exceptions/customExceptions.dart';
import 'package:transmedia/data/models/product_model.dart';

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {

  ProductRemoteDatasourceImpl(this._apiManager);
  final APIManager _apiManager;


  @override
  Future<List<ProductModel>> getAllProductsFromApi() async {
    // Use the APIManager to make an API call
    try {
      final response = await _apiManager.getWithHeader(
        url: ApiUrl.productList,
        headerData: {},
      );

      debugPrint('ProductRemoteDatasourceImpl.getAllProductsFromApi:$response');
      // Process and return the response as needed
      return List.from(response.map((item) => ProductModel.fromJson(item)));
    } on Exception catch (e) {
      // TODO
      throw ServerException();
    }
  }
}
