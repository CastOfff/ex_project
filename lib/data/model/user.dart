class User {
  String? id;
  String? name;
  String? avatarPath;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;
  User(
      {this.password,
        this.phone,
        this.email,
        this.id,
        this.name,
        this.avatarPath,
        this.confirmPassword,
      });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'avatarPath': avatarPath,
    'phone': phone,
    'email': email,
    'password': password,
    'confirmPassword': confirmPassword
  };

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      avatarPath: json['avatarPath'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
    );
  }


}