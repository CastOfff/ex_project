
import 'package:flutter/material.dart';

import 'color.dart';
import 'home/our_restaurant.dart';

class OurRestaurantPage extends StatefulWidget {
  const OurRestaurantPage({super.key});

  @override
  State<OurRestaurantPage> createState() => _OurRestaurantPageState();
}

class _OurRestaurantPageState extends State<OurRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }
            , icon: const Icon(Icons.keyboard_backspace, size: 30),
          ),
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Our Restaurant',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2B0803),
                  ),
                ),
                Container(
                  height: 25,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ALL'),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.keyboard_arrow_down_sharp)),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: restaurantList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OurRestaurant(
                        name: restaurantList[index]['name'],
                        address: restaurantList[index]['address'],
                      ),
                    );
                  },),
            )
          ],
        ),
      ),
    );
  }
}

