import 'package:ex_project/page/reservation/reservation_tab.dart';
import 'package:ex_project/page/reservation/review_tab.dart';
import 'package:flutter/material.dart';
import '../../core/constants/color.dart';
import 'menu_tab.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 40),
          Stack(
            children: [
              const Image(
                  width: double.infinity,
                  height: 210,
                  image: AssetImage('assets/images/our restaurant.png'),
                  fit: BoxFit.cover
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14),
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
                  const SizedBox(height: 36,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    height: 100,
                    width: double.infinity,
                    color: Colors.grey.withValues(alpha: 0.25),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'An BBQ Dong Khoi',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        Text(
                          'Vincom Center, No. 70 Le Thanh Ton, Ben Nghe Ward, District 1, HCMC',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text(
                              'Now Open',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Text(
                              ' - Closes at 10:00PM',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            color: Colors.white,
            child: TabBar(
              tabs: const [
                Tab(text: 'Reservation'),
                Tab(text: 'Menu'),
                Tab(text: 'Review'),
              ],
              padding: const EdgeInsets.symmetric(vertical: 4),
              labelStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
              controller: tabController,
              labelColor: primaryColor,
              unselectedLabelColor: Colors.black87,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primaryColor.withValues(alpha: 0.1),
              ),
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              dividerColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [ReservationTab(), MenuTab(), ReviewTab()],
            ),
          ),
        ],
      ),
    );
  }
}
