class User {
  String? id;
  String? name;
  String? avatarPath;
  String? phone;
  String? email;
  String? password;
  User(
      {this.password,
        this.phone,
        this.email,
        this.id,
        this.name,
        this.avatarPath,
      });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'avatarPath': avatarPath,
    'phone': phone,
    'email': email,
    'password': password,
  };

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      avatarPath: json['avatarPath'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
    );
  }


}