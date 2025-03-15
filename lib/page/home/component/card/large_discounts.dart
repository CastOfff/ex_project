
import 'package:flutter/material.dart';

import '../../../../router/router_name.dart';


class LargeDiscounts extends StatefulWidget {
  const LargeDiscounts({super.key});

  @override
  State<LargeDiscounts> createState() => _LargeDiscountsState();
}

class _LargeDiscountsState extends State<LargeDiscounts> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        width: 244,
        height: 118,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(colors: [
              Color(0xffdd4227),
              Color(0xfff3ab9a),
            ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            )
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: const Align(
                alignment: Alignment.bottomRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
                  child: Image(
                      width: 110,
                      height: 74,
                      image: AssetImage('assets/images/tim_toomey_unsplash_preview_1.png'),
                      fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('LAAAARDE DISCOUNTS', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 8,),
                  const Row(
                    children: [
                      Text('Upto', style: TextStyle(color: Colors.white),),
                      SizedBox(width: 5,),
                      Text('20%', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                      SizedBox(width: 5,),
                      Text('OFF', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                    ],
                  ),
                  const Text('No Upper Limit!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                  const SizedBox(height: 5,),
                  CircleAvatar(
                    backgroundColor: Colors.white24,
                    maxRadius: 12,
                    minRadius: 9,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouterName.largeDiscountsPage);
                      },
                      icon: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white, size: 9,),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
