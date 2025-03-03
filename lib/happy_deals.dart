import 'package:flutter/material.dart';

import 'large_discounts_page.dart';
import 'router/router_name.dart';

class HappyDeals extends StatefulWidget {
  const HappyDeals({super.key});

  @override
  State<HappyDeals> createState() => _HappyDealsState();
}

class _HappyDealsState extends State<HappyDeals> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: () {
              Navigator.pop(context);
            }
              , icon: const Icon(Icons.keyboard_backspace, size: 30),
            )
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Happy Deals',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 18,),
                Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        if (index % 2 == 0){
                          return buildCard2(context);
                        } else {
                          return buildCard1(context);
                        }
                      },
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
}

Widget buildCard1(BuildContext context) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
        //color: Color(0xff40f9ff),
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(colors: [
            Color(0xff1aab91),
            Color(0xff9af4e3),
          ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          )
      ),
      child: Stack(
        children: [
          const ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
            child: Image(image: AssetImage('assets/images/pngegg.png'), fit: BoxFit.cover),
          ),

          Positioned(
            left: 240,
            right: 15,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('TRY NEW DISHER', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.white24,
                      maxRadius: 12,
                      minRadius: 9,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.white, size: 9,),
                      ),
                    ),
                  ),
                  const Text('Explore uniques taste',),
                  const Text('For new eateries')
                ],
              ),
            ),
          ),
        ],
      )
  );
}

Widget buildCard2(BuildContext context) {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      width: double.infinity,
      height: 140,
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
          const Align(
            alignment: Alignment.bottomRight,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
              child: Image(image: AssetImage('assets/images/pngegg.png'), fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('LAAAARDE DISCOUNTS', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
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