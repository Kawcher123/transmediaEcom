import 'package:dartz/dartz.dart';
import 'package:transmedia/domain/entities/cart_entity.dart';

import '../failures/failures.dart';

abstract class CartRepository
{
  Future<Either<Failure, List<CartEntity>>> getCartListFromDatasource();
  Future<Either<Failure, int>> getLengthFromDatasource();
  Future<Either<Failure, List<CartEntity>>> addToCartToDatabase(CartEntity cartEntity);
  Future<Either<Failure, List<CartEntity>>> updateCartToDatabase(CartEntity cartEntity);
  Future<Either<Failure, List<CartEntity>>> deleteFromCartToDatabase(CartEntity cartEntity);
}