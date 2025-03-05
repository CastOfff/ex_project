import 'package:flutter/material.dart';

class OurRestaurant extends StatefulWidget {
  final String name;
  final String address;
  // final String image;

  const OurRestaurant(
      {super.key,
      required this.name,
      required this.address});

  @override
  State<OurRestaurant> createState() => _OurRestaurantState();
}

class _OurRestaurantState extends State<OurRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158,
      width: 328,
      color: Colors.transparent,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image(image: AssetImage('assets/images/our restaurant.png')),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 62,
              width: 306,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 236,
                          height: 36,
                          child: Text(
                            widget.address,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                            softWrap: true,
                            maxLines: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                  Image(
                    image: AssetImage('assets/images/Logo3 2.png'),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> restaurantList = [
  {
    "name": "An BBQ Dong Khoi",
    "address":
        "Vincom Center, No. 70 Le Thanh Ton, Ben Nghe Ward, District 1, HCMC"
  },
  {
    "name": "An BBQ Su Van Hanh",
    "address": "No. 716 Su Van Hanh, Ward 12, District 10, HCMC"
  },
  {
    "name": "An BBQ Nguyen Van Cu",
    "address": "No. 235 Nguyen Van Cu, Nguyen Van Cu Ward, District 10, HCMC"
  },
  {
    "name": "An BBQ Vo Van Ngan",
    "address": "No. 716 Vo Van Ngan, Binh Tho Ward, Thu Duc City, HCMC"
  }
];
