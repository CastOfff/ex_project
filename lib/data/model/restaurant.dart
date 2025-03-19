class Restaurant {
  String? name;
  String? address;
  String? image;
  Restaurant({required this.name, required this.address, required this.image});

  // Map<String, dynamic> toJson() => {
  //   'name': name,
  //   'address': address,
  // };
  //
  // static Restaurant fromJson(Map<String, dynamic> json) {
  //   return Restaurant(
  //     name: json['name'],
  //     address: json['address'],
  //   );
  // }
}

