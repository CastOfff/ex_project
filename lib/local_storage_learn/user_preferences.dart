import 'dart:convert';

import 'package:ex_project/local_storage_learn/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();

  UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  late SharedPreferences prefs;

  Future<void> onInit() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveUser(User user) async {
    await prefs.setString('user', jsonEncode(user.toJson()));
  }

  User getUser() {
    final userJson = prefs.getString('user');
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return User();
  }
}