
import 'package:dartz/dartz.dart';
import 'package:transmedia/domain/failures/failures.dart';
import 'package:transmedia/domain/repositories/product_repository.dart';

import '../entities/product_entity.dart';

class ProductsUseCase {
  final ProductRepository _repository;

  ProductsUseCase(this._repository);

  Future<Either<Failure, List<ProductEntity>>> getProductsUseCase() {
    return _repository.getProductFromDatasource();
  }
}