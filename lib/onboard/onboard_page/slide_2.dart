import 'package:flutter/material.dart';

import 'onboard_img.dart';

class Slide2 extends StatelessWidget {
  const Slide2({super.key});
  @override
  Widget build(BuildContext context) {
    final OnboardIMG onboardIMG = OnboardIMG();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [const
        SizedBox(height: 20),
          Image(image: onboardIMG.orderIllustration),
          const SizedBox(height: 20),
          const Text(
            'Convenient',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Online dish reservation',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}