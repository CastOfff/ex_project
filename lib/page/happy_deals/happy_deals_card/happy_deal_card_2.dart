import 'package:flutter/material.dart';

import '../../../data/model/happy_deal.dart';
import '../../../router/router_name.dart';

class HappyDealCard2 extends StatefulWidget {
  final HappyDeal happyDeal;

  const HappyDealCard2({super.key, required this.happyDeal});

  @override
  State<HappyDealCard2> createState() => _HappyDealCard2State();
}

class _HappyDealCard2State extends State<HappyDealCard2> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        width: double.infinity,
        height: 124,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(colors: [
              Color(0xffdd4227),
              Color(0xfff3ab9a),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(20)),
                child: Image(
                    image: AssetImage(
                        widget.happyDeal.image ?? 'assets/images/pngegg.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'LAAAARDE DISCOUNTS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Upto',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${widget.happyDeal.discount}%',
                        style: const TextStyle(
                            color: Colors.yellow, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        'OFF',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ],
                  ),
                  const Text(
                    'No Upper Limit!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white24,
                    maxRadius: 12,
                    minRadius: 9,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouterName.largeDiscountsPage,
                          arguments: widget.happyDeal
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
