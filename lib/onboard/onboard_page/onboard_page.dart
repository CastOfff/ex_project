
import 'package:ex_project/onboard/onboard_page/slide_1.dart';
import 'package:ex_project/onboard/onboard_page/slide_2.dart';
import 'package:ex_project/onboard/onboard_page/slide_3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  late final PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              //logo
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/logo.png',
                width: 211,
                height: 102,
              ),
              //content
              Expanded(
                child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    currentPage = value;
                  },
                  children: const [
                    Slide1(),
                    Slide2(),
                    Slide3()
                  ],
                ),
              ),
              const SizedBox(height: 100,),
              //indicator
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // OnboardService.saveOnboardToLocal();
                        // Navigator.pushReplacementNamed(context, RouteNamed.homePage);
                      },
                      child: Text('Skip', style: TextStyle(fontSize: 20),),
                    ),
                    SmoothPageIndicator(
                        controller: controller,
                        // PageController
                        count: 3,
                        effect: WormEffect(activeDotColor: Color(0xffAD3F32)),
                        // your preferred effect
                        onDotClicked: (index) {}),
                    IconButton(
                        onPressed: () {
                          // if (currentPage == 2) {
                          //   OnboardService.saveOnboardToLocal();
                          //   Navigator.pushReplacementNamed(
                          //       context, RouteNamed.homePage);
                          // } else {
                            controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          // }
                        },
                        icon: Icon(Icons.arrow_forward_ios_rounded))
                  ],
                ),
              ),
              SizedBox(height: 20,)
            ],
          )),
    );
  }
}