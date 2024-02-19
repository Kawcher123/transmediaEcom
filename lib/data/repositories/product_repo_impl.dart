import 'package:dartz/dartz.dart';
import 'package:transmedia/data/data_sources/remote/products_data_source.dart';
import 'package:transmedia/data/data_sources/remote/products_data_source_impl.dart';
import 'package:transmedia/data/exceptions/customExceptions.dart';
import 'package:transmedia/data/extensions/product_model_extension.dart';
import 'package:transmedia/data/models/product_model.dart';
import 'package:transmedia/domain/entities/product_entity.dart';
import 'package:transmedia/domain/failures/failures.dart';

import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {

  ProductRepositoryImpl(this._productRemoteDatasource);
  final ProductRemoteDatasourceImpl _productRemoteDatasource;


  @override
  Future<Either<Failure, List<ProductEntity>>> getProductFromDatasource() async {
    // Use a service or provider to fetch data, and then map it to entities
    try {
      final List<ProductModel> productModels = await _productRemoteDatasource.getAllProductsFromApi();
      List<ProductEntity> productEntities = productModels.map((model) => model.toEntity()).toList();

      return right(productEntities);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
