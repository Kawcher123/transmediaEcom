import 'package:transmedia/data/models/cart_model.dart';
import 'package:transmedia/domain/entities/cart_entity.dart';

extension CartEntityExtension on CartEntity {
  CartModel toCartModel() {
    return CartModel(
      id: id,
      title: title,
      qty: qty,
      price: price,
      image: image,
    );
  }
}
