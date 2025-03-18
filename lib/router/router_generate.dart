import 'package:ex_project/page/reservation/reservation_page.dart';
import 'package:ex_project/router/router_name.dart';
import 'package:flutter/material.dart';

import '../page/authentication/get_otp.dart';
import '../page/authentication/login_page.dart';
import '../page/authentication/new_pass_word_page.dart';
import '../page/authentication/sign_up_page.dart';
import '../page/authentication/success_page.dart';
import '../page/authentication/verify_otp.dart';
import '../page/edit_profile/edit_profile_page.dart';
import '../page/happy_deal_reservation/happy_deal_reservation_page.dart';
import '../page/home/home_page.dart';
import '../page/onboard/onboard_page/onboard_page.dart';
import '../page/onboard/splash/splash_page.dart';
import '../page/our_restaurant_page.dart';
import '../page/product/product_best_seller_page.dart';
import '../page/happy_deals.dart';
import '../page/large_discounts_page.dart';
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

      case RouterName.ourRestaurantPage:
        return animationRouterPage(page: const OurRestaurantPage());

      case RouterName.happyDealReservationPage:
        return animationRouterPage(page: const HappyDealReservationPage());

      case RouterName.productBestSellerPage:
        return animationRouterPage(page: const ProductBestSellerPage());

      case RouterName.homePage:
        return animationRouterPage(page: const HomePage());

      case RouterName.splashPage:
        return animationRouterPage(page: const SplashPage());

      case RouterName.onboardPage:
        return animationRouterPage(page: const OnboardPage());

      case RouterName.nearbyRestaurantsPage:
        return animationRouterPage(page: const OurRestaurantPage());

      case RouterName.editProfilePage:
        return animationRouterPage(page: const EditProfilePage());

      case RouterName.reservationPage:
        return animationRouterPage(page: const ReservationPage());

      default:
        return null;
    }
  }
}
