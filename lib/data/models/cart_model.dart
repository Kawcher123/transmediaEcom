import 'package:transmedia/data/models/cart_database_fields_model.dart';

class CartModel {
  int? id;
  String? title;
  int? qty;
  double? price;
  String? image;

  CartModel({
    this.id,
    this.title,
    this.qty,
    this.price,
    this.image,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json[CartFields.id],
      title: json[CartFields.title],
      qty: json[CartFields.qty],
      price: json[CartFields.price],
      image: json[CartFields.image],
    );
  }

  Map<String, Object?> toJson() => {
        CartFields.id: id,
        CartFields.title: title,
        CartFields.qty: qty,
        CartFields.price: price,
        CartFields.image: image,
      };
}
