
import 'dart:convert';

import 'package:ex_project/core/constants/color.dart';
import 'package:flutter/material.dart';

class FlashOrderCard extends StatelessWidget {
  const FlashOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFFFC8C8)
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: AssetImage(
                        'assets/images/logo.png',
                      ),
                      width: 112,
                      height: 54,
                      fit: BoxFit.cover,
                    ),
                    Text('Flash Offer',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: primaryColor
                      ),
                    ),
                    Text('We are here with the\n hottest meals in town', style: TextStyle(fontSize: 8),),
                  ],
                ),
                Row(
                  children: [
                    Text('Reserve',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: primaryColor
                      ),
                    ),
                    SizedBox(width: 6,),
                    Icon(Icons.arrow_forward_ios_rounded, size: 10, color: primaryColor,)
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image(image: AssetImage(
              'assets/images/Meal.png',
            ),
            width: 218,
            height: 134,
            fit: BoxFit.cover,),
          )
        ],
      ),
    );
  }
}
