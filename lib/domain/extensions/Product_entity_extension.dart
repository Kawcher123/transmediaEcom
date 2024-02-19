import 'package:transmedia/data/models/cart_model.dart';
import 'package:transmedia/domain/entities/cart_entity.dart';
import 'package:transmedia/domain/entities/product_entity.dart';

extension ProductEntityExtension on ProductEntity {
  CartEntity toCartEntity(int qty) {
    return CartEntity(
      id: id,
      title: title,
      qty: qty,
      price: price,
      image: image,
    );
  }
}
