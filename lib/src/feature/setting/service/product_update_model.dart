class ProductUpdateModel {
  String? name;
  String? image;
  int? price;
  int? start;
  String? size;
  int? categoryId;

  ProductUpdateModel({
    this.name,
    this.image,
    this.price,
    this.start,
    this.size,
    this.categoryId,
  });

  factory ProductUpdateModel.fromJson(Map<String, dynamic> json) {
    return ProductUpdateModel(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      start: json['start'],
      size: json['size'],
      categoryId: json['categoryId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'start': start,
      'size': size,
      'categoryId': categoryId,
    };
  }
}
