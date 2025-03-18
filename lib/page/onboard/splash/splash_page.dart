
import 'dart:async';

import 'package:flutter/material.dart';

import '../../../router/router_name.dart';
import 'onboard_sevices.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
          () {
        final isFirstOpen = OnboardService.isFirstOpen();
        if (isFirstOpen) {
          Navigator.pushReplacementNamed(context, RouterName.onboardPage);
        } else {
          Navigator.pushReplacementNamed(context, RouterName.homePage);
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 211,
          height: 102,
        ),
      ),
    );
  }
}