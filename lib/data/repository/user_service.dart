import 'dart:convert';

import 'package:ex_project/data/model/user.dart';
import 'package:http/http.dart' as http;

import '../local_storage/user_preferences.dart';

class UserService {
  UserPreferences userPreferences = UserPreferences();
  String domain = '67caf9da3395520e6af3dbc6.mockapi.io';

  Map<String, String> getHeader() {
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    if (userPreferences.accessToken != '') {
      header['Authorization'] = 'Bearer ${userPreferences.accessToken}';
    }
    return header;
  }

  Future<User?> getUsersFormSever({required String phone, required String password}) async {
    final url = Uri.https(domain, '/users');
    try {
      final response = await http.get(url, headers: getHeader());
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        for (var item in data) {
          if (item['phone'] == phone && item['password'] == password) {
            return User.fromJson(item);
          }
        }
      }
    } catch (e) {
      print('Error fetching users: $e');
    }
    return null;
  }

  Future<User?> updateUser (User user) async {
    final response = await http.put(
      Uri.https(domain, '/users/${user.id}'),
      headers: getHeader(),
      body: jsonEncode(user.toJson()),
    );
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return User.fromJson(data);
  }

  Future<User?> createUser(User user) async {
    final response = await http.post(
      Uri.https(domain, '/users'),
      headers: getHeader(),
      body: jsonEncode(user.toJson()
      ),
    );
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return User.fromJson(data);
  }

}