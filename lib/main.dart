import 'package:ex_project/core/constants/color.dart';
import 'package:ex_project/page/edit_profile/edit_profile_page.dart';
import 'package:ex_project/page/home/home_page.dart';
import 'package:ex_project/page/notification/notification_page.dart';
import 'package:ex_project/page/reservation/reservation_page.dart';
import 'package:ex_project/page/your_reservation/your_reservation_page.dart';
import 'package:ex_project/router/router_generate.dart';
import 'package:ex_project/router/router_name.dart';

import 'package:flutter/material.dart';

import 'data/local_storage/app_preferences.dart';
import 'data/local_storage/reservation_preferences.dart';
import 'data/local_storage/user_preferences.dart';

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
      // home: const YourReservationPage(),
      initialRoute: RouterName.splashPage,
      onGenerateRoute: RouteGenerator.generateRoute
    );
  }
}
