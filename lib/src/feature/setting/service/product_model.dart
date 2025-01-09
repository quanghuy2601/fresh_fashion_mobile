class ProductModel {
  int? id;
  String? name;
  String? image;
  int? price;
  int? start;
  String? size;
  int? categoryId;
  int? ownerId;

  ProductModel({
    this.id,
    this.name,
    this.image,
    this.price,
    this.start,
    this.size,
    this.categoryId,
    this.ownerId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
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
      'id': id,
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
