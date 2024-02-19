import 'package:transmedia/data/models/cart_model.dart';
import 'package:transmedia/domain/entities/cart_entity.dart';

extension CartModelExtension on CartModel {
  CartEntity toEntity() {
    return CartEntity(
      id: id,
      title: title,
      qty: qty,
      price: price,
      image: image,
    );
  }
}
