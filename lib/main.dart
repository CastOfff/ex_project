import 'package:ex_project/color.dart';
import 'package:ex_project/sign_up/sign_up_page.dart';
import 'package:ex_project/state_management/ex_1.dart';
import 'package:flutter/material.dart';

import 'happy_deals.dart';

import 'local_storage_learn/user_preferences.dart';
import 'sign_up/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initPref();
  runApp(const MyApp());
}

initPref() async {
    UserPreferences userPreferences = UserPreferences();
    await userPreferences.onInit();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}





