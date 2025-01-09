class ProductAddModel {
  String? name;
  String? image;
  int? price;
  int? start;
  String? size;
  int? categoryId;
  int? ownerId;

  ProductAddModel({
    this.name,
    this.image,
    this.price,
    this.start,
    this.size,
    this.categoryId,
    this.ownerId,
  });

  factory ProductAddModel.fromJson(Map<String, dynamic> json) {
    return ProductAddModel(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      start: json['start'],
      size: json['size'],
      categoryId: json['categoryId'],
      ownerId: json['ownerId'],
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
      'ownerId': ownerId,
    };
  }
}
