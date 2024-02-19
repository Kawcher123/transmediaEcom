import 'package:transmedia/domain/entities/cart_entity.dart';

import '../../data/models/product_model.dart';
import '../../domain/entities/product_entity.dart';

extension ProductModelExtension on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      content: content,
      image: image,
      thumbnail: thumbnail,
      status: status,
      category: category,
    );
  }



  CartEntity toCartEntity(int qty) {
    return CartEntity(
      id: id,
      title: title,
      image: image,
      qty: qty
    );
  }
}