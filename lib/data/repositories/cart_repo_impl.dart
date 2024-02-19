import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:transmedia/data/data_sources/local/cart_data_source_impl.dart';
import 'package:transmedia/data/exceptions/customExceptions.dart';
import 'package:transmedia/data/extensions/cart_model_extension.dart';
import 'package:transmedia/data/models/cart_model.dart';
import 'package:transmedia/domain/entities/cart_entity.dart';
import 'package:transmedia/domain/extensions/cart_entity_extension.dart';
import 'package:transmedia/domain/failures/failures.dart';
import 'package:transmedia/domain/repositories/cart_repository.dart';

class CartRepoImpl implements CartRepository {
  final CartLocalDatasourceImpl _cartLocalDatasourceImpl;
  CartRepoImpl(this._cartLocalDatasourceImpl);
  @override
  Future<Either<Failure, List<CartEntity>>> addToCartToDatabase(CartEntity cartEntity) async {
    // TODO: implement addToCartToDatabase

    try {
      CartModel cartModel = cartEntity.toCartModel();
      List<CartModel> cartModels = await _cartLocalDatasourceImpl.addToCartListFromDB(cartModel);
      List<CartEntity> cartEntities = cartModels.map((model) => model.toEntity()).toList();

      return right(cartEntities);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } on DatabaseException catch (e) {
      return left(DuplicateRowDatabaseFailure());
    } catch (e) {
      print('CartRepoImpl.addToCartToDatabase: $e');
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, List<CartEntity>>> deleteFromCartToDatabase(CartEntity cartEntity) async {
    // TODO: implement deleteFromCartToDatabase
    try {
      CartModel cartModel = cartEntity.toCartModel();
      List<CartModel> cartModels = await _cartLocalDatasourceImpl.deleteFromCartListFromDB(cartModel);
      List<CartEntity> cartEntities = cartModels.map((model) => model.toEntity()).toList();

      return right(cartEntities);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      print('CartRepoImpl.addToCartToDatabase: $e');
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, List<CartEntity>>> getCartListFromDatasource() async {
    // TODO: implement getCartListFromDatasource

    try {
      List<CartModel> cartModels = await _cartLocalDatasourceImpl.getAllCartListFromDB();
      List<CartEntity> cartEntities = cartModels.map((model) => model.toEntity()).toList();

      return right(cartEntities);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, List<CartEntity>>> updateCartToDatabase(CartEntity cartEntity) async {
    // TODO: implement updateCartToDatabase
    try {
      CartModel cartModel = cartEntity.toCartModel();
      List<CartModel> cartModels = await _cartLocalDatasourceImpl.updateCartListFromDB(cartModel);
      List<CartEntity> cartEntities = cartModels.map((model) => model.toEntity()).toList();

      return right(cartEntities);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      print('CartRepoImpl.addToCartToDatabase: $e');
      return left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, int>> getLengthFromDatasource() async {
    // TODO: implement getLengthFromDatasource
    try {
      int count = await _cartLocalDatasourceImpl.getCartLengthFromDB();

      return right(count);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
