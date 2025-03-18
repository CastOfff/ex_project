import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class UserPreferences {
  final String USER = 'user';
  final String ACESS_TOKEN = 'access_token';
  final String LoggedIn = 'logged_in';
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
    await prefs.setString(USER, jsonEncode(user.toJson()));
  }

  User getUser() {
    final userJson = prefs.getString(USER);
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return User();
  }

  Future<void> saveToken(String token) async {
    await prefs.setString(ACESS_TOKEN, token);
  }

  String get accessToken {
    final token = prefs.getString(ACESS_TOKEN);
    if (token != null) {
      return token;
    }
    return '';
  }


  Future<void> removeUser() async {
    await prefs.remove(USER);
  }


  /// Save Login Status
  Future<void> saveLoginStatus(bool isLoggedIn) async {
    await prefs.setBool('is_logged_in', isLoggedIn);
  }

  Future<bool> getLoginStatus() async {
    return prefs.getBool('is_logged_in') ?? false;
  }
}