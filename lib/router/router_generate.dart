
import 'package:ex_project/router/router_name.dart';
import 'package:flutter/material.dart';

import '../authentication/get_otp.dart';
import '../authentication/verify_otp.dart';
import '../authentication/new_pass_word_page.dart';
import '../authentication/success_page.dart';
import '../authentication/login_page.dart';
import '../authentication/sign_up_page.dart';
import '../happy_deals.dart';
import '../large_discounts_page.dart';
import 'animation_router_page.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.loginPage:
        return animationRouterPage(page: const LoginPage());

      case RouterName.signUpPage:
        return animationRouterPage(page: const SignUpPage());

      case RouterName.happyDeals:
        return animationRouterPage(page: const HappyDeals());

      case RouterName.getOTP:
        return animationRouterPage(page: const GetOTP());

      case RouterName.verifyOTP:
        return animationRouterPage(page: const VerifyOTP());

      case RouterName.newPassWordPage:
        return animationRouterPage(page: const NewPassWordPage());

      case RouterName.successPage:
        return animationRouterPage(page: const SuccessPage());

      case RouterName.largeDiscountsPage:
        return animationRouterPage(page: const LargeDiscountsPage());
    }
    return null;
  }
}