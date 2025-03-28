import 'package:ex_project/data/model/happy_deal.dart';
import 'package:flutter/material.dart';

import '../../../router/router_name.dart';

class HappyDealCard1 extends StatefulWidget {
  final HappyDeal happyDeal;

  const HappyDealCard1({super.key, required this.happyDeal});

  @override
  State<HappyDealCard1> createState() => _HappyDealCard1State();
}

class _HappyDealCard1State extends State<HappyDealCard1> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        height: 124,
        decoration: BoxDecoration(
            //color: Color(0xff40f9ff),
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(colors: [
              Color(0xff1aab91),
              Color(0xff8de8d6),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(20)),
                child: Image(
                    image: AssetImage(
                        widget.happyDeal.image ?? 'assets/images/pngegg.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              left: 220,
              right: 15,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'TRY NEW DISHER',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouterName.largeDiscountsPage, arguments: widget.happyDeal);
                        },
                        icon: const CircleAvatar(
                          backgroundColor: Colors.white24,
                          maxRadius: 12,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Explore uniques taste',
                    ),
                    const Text('For new eateries')
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
