class Restaurant {
  String? id;
  String? name;
  String? address;
  String? image;
  bool? discount;
  Restaurant({required this.id, required this.name, required this.address, this.image, this.discount = false});

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'address': address,
    'image': image,
    'discount': discount,
  };

  static Restaurant fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      image: json['image'],
      discount: json['discount'].toString() == 'true' ? true : false,
    );
  }
}

