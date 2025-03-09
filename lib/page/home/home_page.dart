
import 'package:ex_project/core/widget/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/widget/our_restaurant_card.dart';
import '../../restaurant_list.dart';
import '../../router/router_name.dart';
import 'flash_order_card.dart';
import 'large_discounts.dart';
import 'title_home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      backgroundColor: const Color(0xFFF6EFE8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6EFE8),
        leading: Icon(Icons.menu, size: 32,),
        titleTextStyle: TextStyle(fontSize: 18, color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, fill: 0, color: Colors.black87,),
            SizedBox(width: 10,),
            Text('Dong Khoi St, District 1')
          ],
        ),
        centerTitle: true,
        actions: [
          CircleAvatar(
              backgroundColor: Colors.white,
              maxRadius: 20,
              child: Icon(Icons.notifications_none, color: Colors.black, size: 32,)
          ),
          SizedBox(width: 20,),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          child: Column(
            spacing: 6,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white)
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    currentPage = value;
                  },
                  children: const [
                    FlashOrderCard(),
                    FlashOrderCard(),
                    FlashOrderCard(),
                  ]
                ),
              ),
              SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 6.0,
                    dotHeight: 6.0,
                    activeDotColor: Color(0xffAD3F32),
                    dotColor: Colors.grey,
                  ),
                  // WormEffect(activeDotColor: Color(0xffAD3F32)),
                  onDotClicked: (index) {}
              ),
              TitleHomeScreen(
                  title: 'Best Seller',
                  onTap: () {
                    Navigator.pushNamed(context, RouterName.productBestSellerPage);
                  }
              ),
              SizedBox(
                height: 222,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                  itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: BestSellerItem(),
                      );
                    },
                ),
              ),
              TitleHomeScreen(
                title: 'Our Restaurant',
                onTap: () {
                  Navigator.pushNamed(context, RouterName.ourRestaurantPage);
                },
              ),
              Column(
                spacing: 11,
                children: List.generate(3, (index) => OurRestaurantCard(
                  name: restaurantList[index]['name'],
                  address: restaurantList[index]['address'],
                )),
              ),
              TitleHomeScreen(
                title: 'Happy deal',
                onTap: () {
                  Navigator.pushNamed(context, RouterName.happyDeals);
                },
              ),
              SizedBox(
                height: 118,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: LargeDiscounts(),
                      );
                    },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
