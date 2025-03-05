
import 'package:flutter/material.dart';

class NearbyRestaurantsPage extends StatefulWidget {
  const NearbyRestaurantsPage({super.key});

  @override
  State<NearbyRestaurantsPage> createState() => _NearbyRestaurantsPageState();
}

class _NearbyRestaurantsPageState extends State<NearbyRestaurantsPage> with TickerProviderStateMixin{
  late TabController pageController;
  @override
  void initState() {
    // TODO: implement initState
    pageController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6EFE8),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 54, right: 54, top: 72, bottom: 18),
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(height: 100),
              Image.asset('assets/images/tracking_maps.png'),
              const SizedBox(height: 36,),
              const Text('Nearby restaurants'),
              const Text('Don\'t have to go far to find a good restaurant'),
              const SizedBox(height: 36,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Skip'),
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.redAccent, size: 12,),
                      Icon(Icons.circle, color: Colors.grey,size: 12,),
                      Icon(Icons.circle,color: Colors.grey,size: 12,),
                    ],
                  ),
                  IconButton(
                      onPressed: null,
                      icon: Icon(Icons.arrow_forward_ios_rounded))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
