import 'package:ex_project/color.dart';
import 'package:ex_project/happy_deals.dart';
import 'package:ex_project/large_discounts_page.dart';
import 'package:ex_project/router/router_generate.dart';
import 'package:ex_project/router/router_name.dart';

import 'package:flutter/material.dart';
import 'local_storage_learn/user_preferences.dart';

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
      initialRoute: RouterName.loginPage,
      onGenerateRoute: RouteGenerator.generateRoute
    );
  }
}
