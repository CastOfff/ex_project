import 'package:ex_project/core/widget/verify_common_button.dart';
import 'package:flutter/material.dart';

import '../../router/router_name.dart';

class LargeDiscountsPage extends StatefulWidget {
  const LargeDiscountsPage({super.key});

  @override
  State<LargeDiscountsPage> createState() => _LargeDiscountsPageState();
}

class _LargeDiscountsPageState extends State<LargeDiscountsPage> with SingleTickerProviderStateMixin{
  late AnimationController _cocaAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    _cocaAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300)
    )..repeat(reverse: true);
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _cocaAnimationController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(colors: [
                  Color(0xfff38472),
                  Color(0xfff3b5a8),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
          ),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              /// tieu de
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 26, top: 40, bottom: 10),
                child: Row(
                  children: [
                    Flexible(
                      child: CircleAvatar(
                        backgroundColor: Colors.white24,
                        maxRadius: 20,
                        minRadius: 16,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Flexible(
                      flex: 6,
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Laaarge',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Flexible(
                              child: Text(
                                'Discounts',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              /// THAN PAGE
              Stack(
                children: [
                  SizedBox(
                    height: 320,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0.1, end: 1.0),
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeOut,
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: value,
                            child: child,
                          );
                        },
                        child: const Image(
                            height: 200,
                            width: 260,
                            image: AssetImage('assets/images/tim_toomey_unsplash_preview_1.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Free',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '2 drinks',
                                  style: TextStyle(
                                    color: Color(0xFF992C1E),
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            AnimatedBuilder(
                              animation: _cocaAnimationController,
                              builder: (context, child) {
                                return Transform.rotate(
                                  angle: _cocaAnimationController.value * 0.1 * 3.14,
                                  child: child,
                                );
                              },
                              child: Image(
                                  width: 86,
                                  height: 120,
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                          'assets/images/coca_cola_color_picture_sticker.png')
                                      .image),
                            )
                            // Image.asset('assets/images/coca_cola_color_picture_sticker.png')
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'UP TO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          '20%',
                          style: TextStyle(
                            color: Color(0xFFB13325),
                            fontSize: 70,
                            fontWeight: FontWeight.w900,
                            height: 0.95,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2.5, 2.5),
                                color: Colors.white,
                              ),
                            ]
                          ),
                        ),
                        const Text(
                          'OFF',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600
                          )
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        const Text(
                          'NO UPPER LIMIT!',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600
                            )
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20),),
                color: Colors.white.withValues(alpha: 0.9)
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                        'Terms & Condition',
                      style: TextStyle(
                        color: Color(0xff140501),
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: -600, end: 0),
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(value, 0),
                          child: child,
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '20% off for family reservation',
                                style: TextStyle(
                                    color: Color(0xff140501),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              SizedBox(height: 18,),
                              Text(
                                'Time slots from 10:00 to 15:00',
                                style: TextStyle(
                                    color: Color(0xff140501),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),
                          Image(
                              width: 100,
                              height: 100,
                              image: AssetImage('assets/images/Intro_family.png'),
                              fit: BoxFit.cover
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 600, end: 1),
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(value, 1),
                          child: child,
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image(
                              width: 100,
                              height: 100,
                              image: AssetImage('assets/images/Intro_rate.png'),
                              fit: BoxFit.cover
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Applicable to all branches',
                                style: TextStyle(
                                    color: Color(0xff140501),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              SizedBox(height: 18,),
                              Text(
                                'Valid until 31st October, 2021',
                                style: TextStyle(
                                    color: Color(0xff140501),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(height: 32,),
                    VerifyCommonButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouterName.happyDealReservationPage);
                      },
                      title: 'GET IT NOW',
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}
