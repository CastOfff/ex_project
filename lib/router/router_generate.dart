import 'package:ex_project/page/happy_deals/happy_deals_page.dart';
import 'package:ex_project/page/reservation/reservation_page.dart';
import 'package:ex_project/router/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/happy_deal.dart';
import '../page/authentication/get_otp.dart';
import '../page/authentication/login_page.dart';
import '../page/authentication/new_pass_word_page.dart';
import '../page/authentication/sign_up_page.dart';
import '../page/authentication/success_page.dart';
import '../page/authentication/verify_otp.dart';
import '../page/edit_profile/edit_profile_page.dart';
import '../page/happy_deals/happy_deal_reservation/happy_deal_reservation_page.dart';
import '../page/home/home_page.dart';
import '../page/notification/notification_page.dart';
import '../page/onboard/onboard_page/onboard_page.dart';
import '../page/onboard/splash/splash_page.dart';
import '../page/our_restaurant_page.dart';
import '../page/product/product_best_seller_page.dart';
import '../page/happy_deals/large_discounts_page.dart';
import '../page/reservation_history_detail/reservation_detail/bloc/reservation_detail_bloc.dart';
import '../page/reservation_history_detail/reservation_detail/reservation_detail_page.dart';
import '../page/reservation_history_detail/reservation_detail/reservation_review_page.dart';
import '../page/reservation_history_detail/reservation_history/reservation_history_page.dart';
import 'animation_router_page.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.loginPage:
        return animationRouterPage(page: const LoginPage());

      case RouterName.signUpPage:
        return animationRouterPage(page: const SignUpPage());

      case RouterName.happyDealsPage:
        return animationRouterPage(page: const HappyDealsPage());

      case RouterName.getOTP:
        return animationRouterPage(page: const GetOTP());

      case RouterName.verifyOTP:
        return animationRouterPage(page: const VerifyOTP());

      case RouterName.newPassWordPage:
        return animationRouterPage(page: const NewPassWordPage());

      case RouterName.successPage:
        return animationRouterPage(page: const SuccessPage());

      case RouterName.largeDiscountsPage:
        final HappyDeal happyDeal = settings.arguments as HappyDeal;
        return animationRouterPage(page: LargeDiscountsPage(happyDeal: happyDeal));

      case RouterName.ourRestaurantPage:
        return animationRouterPage(page: const OurRestaurantPage());

      case RouterName.happyDealReservationPage:
        final HappyDeal happyDeal = settings.arguments as HappyDeal;
        return animationRouterPage(page: HappyDealReservationPage(
          happyDeal: happyDeal,
        ));

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

      case RouterName.reservationHistoryPage:
        return animationRouterPage(page: const ReservationHistoryPage());

      case RouterName.reservationDetailPage:
        final int index = settings.arguments as int;
        return animationRouterPage(
          page: BlocProvider(
            create: (context) => ReservationDetailBloc()
              ..add(ReservationDetailFetchEvent(index: index)),
            child: const ReservationDetailPage(),
          ),
        );

        case RouterName.reservationReviewPage:
          final int index = settings.arguments as int; ;
          return animationRouterPage(
            page: BlocProvider(
              create: (context) => ReservationDetailBloc()
                ..add(ReservationDetailFetchEvent(index: index)),
              child: const ReservationReviewPage(),
            )
          );

      case RouterName.notificationPage:
        return animationRouterPage(page: const NotificationPage());

      default:
        return null;
    }
  }
}
