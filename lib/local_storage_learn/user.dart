
import 'dart:convert';

class User {
  String? name;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;

  User({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  static const nameKey = 'name';
  static const phoneKey = 'phone';
  static const emailKey = 'email';
  static const passwordKey = 'password';
  static const confirmPasswordKey = 'confirmPassword';

  static User fromJson(Map<String, dynamic> json) {
    return User(
      name: json[nameKey] as String,
      phone: json[phoneKey] as String,
      email: json[emailKey] as String,
      password: json[passwordKey]  as String,
      confirmPassword: json[confirmPasswordKey] as String,
    );
  }

}