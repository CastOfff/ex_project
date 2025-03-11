import 'package:ex_project/core/constants/color.dart';
import 'package:ex_project/page/reservation/reservation_page.dart';

import 'package:flutter/material.dart';
import 'local_storage/app_preferences.dart';
import 'local_storage/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initPref();
  runApp(const MyApp());
}

initPref() async {
  UserPreferences userPreferences = UserPreferences();
  await AppPreference.init();
  await userPreferences.onInit();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      debugShowCheckedModeBanner: false,
      home: const ReservationPage(),
      // initialRoute: RouterName.splashPage,
      // onGenerateRoute: RouteGenerator.generateRoute
    );
  }
}
