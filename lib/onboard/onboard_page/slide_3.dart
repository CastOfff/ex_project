import 'package:flutter/material.dart';

import 'onboard_img.dart';

class Slide3 extends StatelessWidget {
  const Slide3({super.key});
  @override
  Widget build(BuildContext context) {
    final OnboardIMG onboardIMG = OnboardIMG();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [const
        SizedBox(height: 20),
          Image(image: onboardIMG.safeFood),
          const SizedBox(height: 20),
          const Text(
            'Delicious',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Enjoy great food with your family',
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