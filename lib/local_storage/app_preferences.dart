
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static SharedPreferences? preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }
}