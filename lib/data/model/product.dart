class Product {
  final String? id;
  final DateTime? createdAt;
  final String? name;
  final String? image;
  final String? description;
  final String? reviewCount;
  final String? price;
  Product({
    this.id,
    this.createdAt,
    this.name,
    this.image,
    this.description,
    this.reviewCount,
    this.price,
});

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      name: json['name'],
      image: json['image'],
      description: json['description'],
      reviewCount: json['reviewCount'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt?.toIso8601String(),
      'name': name,
      'image': image,
      'description': description,
      'reviewCount': reviewCount,
      'price': price,
    };
  }
}