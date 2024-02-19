import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:transmedia/data/data_sources/api/api_manager.dart';
import 'package:transmedia/data/data_sources/api/api_url.dart';
import 'package:transmedia/data/data_sources/local/cart_data_source.dart';
import 'package:transmedia/data/data_sources/local/sqlite_data_service.dart';
import 'package:transmedia/data/data_sources/remote/products_data_source.dart';
import 'package:transmedia/data/exceptions/customExceptions.dart';
import 'package:transmedia/data/models/cart_model.dart';
import 'package:transmedia/data/models/product_model.dart';

class CartLocalDatasourceImpl implements CartLocalDatasource {
  final SqliteService _sqliteService = SqliteService.sqliteService;

  @override
  Future<List<CartModel>> getAllCartListFromDB() async {
    List<CartModel> cartList = [];

    try {
      cartList = await _sqliteService.readAll();
    } on Exception catch (e) {
      // TODO

      rethrow;
    }
    return cartList;
  }

  @override
  Future<List<CartModel>> addToCartListFromDB(CartModel cartModel) async {
    // TODO: implement addToCartListFromDB
    List<CartModel> cartList = [];

    try {
      int id = await _sqliteService.createItem(cartModel);
      cartList=await _sqliteService.readAll();
    } on DatabaseException catch (e) {
      // TODO

      debugPrint('error in add to cart datA SOURCE: ${e.isUniqueConstraintError()}');
      rethrow;
    }
    return cartList;
  }

  @override
  Future<List<CartModel>> deleteFromCartListFromDB(CartModel cartModel) async {
    // TODO: implement deleteFromCartListFromDB
    List<CartModel> cartList = [];

    try {
      int id = await _sqliteService.delete(cartModel.id!);
      cartList=await _sqliteService.readAll();
    } on Exception catch (e) {
      // TODO

      debugPrint('error in add to cart datA SOURCE: ${e}');
      rethrow;
    }
    return cartList;
  }

  @override
  Future<List<CartModel>> updateCartListFromDB(CartModel cartModel) async {
    // TODO: implement updateCartListFromDB
    List<CartModel> cartList = [];
    try {
      int id = await _sqliteService.update(cartModel);
      cartList=await _sqliteService.readAll();
      return cartList;
    } on Exception catch (e) {
      // TODO

      debugPrint('error in add to cart datA SOURCE: ${e}');
      rethrow;
    }
  }

  @override
  Future<int> getCartLengthFromDB() async {
    // TODO: implement getCartLengthFromDB

    try {
      int length = await _sqliteService.getCartCount();
      return length;
    } on Exception catch (e) {
      // TODO

      debugPrint('error in add to cart datA SOURCE: $e');
      rethrow;
    }
  }
}
