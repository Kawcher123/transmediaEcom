class ProductEntity {
  int? id;
  String? title;
  String? content;
  String? image;
  String? thumbnail;
  String? status;
  String? category;
  double? price;

  ProductEntity({
    this.id,
    this.title,
    this.content,
    this.image,
    this.thumbnail,
    this.status,
    this.category,
    this.price=100,
  });
}
