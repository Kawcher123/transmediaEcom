

import 'package:dartz/dartz.dart';
import 'package:transmedia/domain/entities/cart_entity.dart';
import 'package:transmedia/domain/failures/failures.dart';
import 'package:transmedia/domain/repositories/cart_repository.dart';

class CartUseCase{

  final CartRepository _cartRepository;

  CartUseCase(this._cartRepository);


  Future<Either<Failure, List<CartEntity>>> addToCartUseCase(CartEntity cartEntity)async
  {
   return  await _cartRepository.addToCartToDatabase(cartEntity);
  }

  Future<Either<Failure, List<CartEntity>>> updateCartUseCase(CartEntity cartEntity)async
  {
    return  await _cartRepository.updateCartToDatabase(cartEntity);
  }

  Future<Either<Failure, List<CartEntity>>> deleteFromCartUseCase(CartEntity cartEntity)async
  {
    return  await _cartRepository.deleteFromCartToDatabase(cartEntity);
  }


  Future<Either<Failure, List<CartEntity>>> getCartListUseCase()async
  {
    return await _cartRepository.getCartListFromDatasource();
  }


  Future<Either<Failure, int>> getCartLengthUseCase()async
  {
    return await _cartRepository.getLengthFromDatasource();
  }
}