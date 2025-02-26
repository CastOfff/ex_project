import 'package:ex_project/color.dart';
import 'package:ex_project/router_name.dart';
import 'package:ex_project/sign_up/forgot_password_1.dart';
import 'package:ex_project/sign_up/forgot_password_2.dart';
import 'package:ex_project/sign_up/forgot_password_3.dart';
import 'package:ex_project/sign_up/forgot_password_4.dart';
import 'package:ex_project/sign_up/sign_up_page.dart';
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
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case RouterName.login_page:
            return MaterialPageRoute(builder: (context) => const LoginPage());
          case RouterName.sign_up_page:
            return MaterialPageRoute(builder: (context) => const SignUpPage());
          case RouterName.happy_deals:
            return MaterialPageRoute(builder: (context) => const HappyDeals());
          case RouterName.forgot_password_1:
            return MaterialPageRoute(builder: (context) => const ForgotPassword1());
          case RouterName.forgot_password_2:
            return MaterialPageRoute(builder: (context) => const ForgotPassword2());
          case RouterName.forgot_password_3:
            return MaterialPageRoute(builder: (context) => const ForgotPassword3());
          case RouterName.forgot_password_4:
            return MaterialPageRoute(builder: (context) => const ForgotPassword4());
        }
        return null;
      },
    );
  }
}
