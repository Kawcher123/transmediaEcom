import 'package:dartz/dartz.dart';
import 'package:transmedia/domain/entities/product_entity.dart';

import '../failures/failures.dart';

abstract class ProductRepository
{
  Future<Either<Failure, List<ProductEntity>>> getProductFromDatasource();
}