import 'package:ex_project/data/model/restaurant.dart';

class HappyDeal {
  String id;
  int discount;
  String? image;
  List<Restaurant> restaurants;

  HappyDeal(
      {required this.id,
      required this.restaurants,
      this.image,
      required this.discount});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'discount': discount,
      'image': image,
      'restaurants':
          restaurants.map((restaurant) => restaurant.toJson()).toList(),
    };
  }

  factory HappyDeal.fromJson(Map<String, dynamic> json) {
    return HappyDeal(
      id: json['id'],
      discount: json['discount'],
      image: json['image'],
      restaurants: (json['restaurants'] as List)
          .map((restaurantJson) => Restaurant.fromJson(restaurantJson))
          .toList(),
    );
  }
}

List<HappyDeal> mockHappyDeals = [
  HappyDeal(
    id: 'happy_deal_1',
    discount: 10,
    image: 'assets/images/happy_deal_1.png',
    restaurants: [
      Restaurant(
        id: '1',
        name: 'An BBQ Dong Khoi',
        address:
            'Vincom Center, No. 70 Le Thanh Ton, Ben Nghe Ward, District 1, HCMC',
        discount: true,
      ),
      Restaurant(
        id: '2',
        name: 'An BBQ Su Van Hanh',
        address: 'No. 716 Su Van Hanh, Ward 12, District 10, HCMC',
        discount: true,
      ),
      Restaurant(
        id: '3',
        name: 'An BBQ Nguyen Van Cu',
        address: 'No. 235 Nguyen Van Cu, Nguyen Van Cu Ward, District 10, HCMC',
        discount: true,
      ),
      Restaurant(
        id: '4',
        name: 'An BBQ Vo Van Ngan',
        address: 'No. 716 Vo Van Ngan, Binh Tho Ward, Thu Duc City, HCMC',
        discount: true,
      )
    ],
  ),
  HappyDeal(
    id: 'happy_deal_2',
    discount: 15,
    image: 'assets/images/happy_deal_2.png',
    restaurants: [
      Restaurant(
        id: '1',
        name: 'An BBQ Dong Khoi',
        address:
        'Vincom Center, No. 70 Le Thanh Ton, Ben Nghe Ward, District 1, HCMC',
        discount: true,
      ),
      Restaurant(
        id: '2',
        name: 'An BBQ Su Van Hanh',
        address: 'No. 716 Su Van Hanh, Ward 12, District 10, HCMC',
        discount: true,
      ),
      Restaurant(
        id: '3',
        name: 'An BBQ Nguyen Van Cu',
        address: 'No. 235 Nguyen Van Cu, Nguyen Van Cu Ward, District 10, HCMC',
        discount: true,
      ),
    ],
  ),
  HappyDeal(
    id: 'happy_deal_3',
    discount: 20,
    image: 'assets/images/happy_deal_3.png',
    restaurants: [
      Restaurant(
        id: '2',
        name: 'An BBQ Su Van Hanh',
        address: 'No. 716 Su Van Hanh, Ward 12, District 10, HCMC',
        discount: true,
      ),
      Restaurant(
        id: '3',
        name: 'An BBQ Nguyen Van Cu',
        address: 'No. 235 Nguyen Van Cu, Nguyen Van Cu Ward, District 10, HCMC',
        discount: true,
      ),
      Restaurant(
        id: '4',
        name: 'An BBQ Vo Van Ngan',
        address: 'No. 716 Vo Van Ngan, Binh Tho Ward, Thu Duc City, HCMC',
        discount: true,
      )
    ],
  ),
  HappyDeal(
    id: 'happy_deal_4',
    discount: 25,
    image: 'assets/images/happy_deal_4.png',
    restaurants: [
      Restaurant(
        id: '2',
        name: 'An BBQ Su Van Hanh',
        address: 'No. 716 Su Van Hanh, Ward 12, District 10, HCMC',
        discount: true,
      ),
      Restaurant(
        id: '3',
        name: 'An BBQ Nguyen Van Cu',
        address: 'No. 235 Nguyen Van Cu, Nguyen Van Cu Ward, District 10, HCMC',
        discount: true,
      ),
    ],
  ),
  HappyDeal(
    id: 'happy_deal_5',
    discount: 30,
    image: 'assets/images/happy_deal_5.png',
    restaurants: [
      Restaurant(
        id: '3',
        name: 'An BBQ Nguyen Van Cu',
        address: 'No. 235 Nguyen Van Cu, Nguyen Van Cu Ward, District 10, HCMC',
        discount: true,
      ),
      Restaurant(
        id: '4',
        name: 'An BBQ Vo Van Ngan',
        address: 'No. 716 Vo Van Ngan, Binh Tho Ward, Thu Duc City, HCMC',
        discount: true,
      )
    ],
  ),
  HappyDeal(
    id: 'happy_deal_6',
    discount: 30,
    image: 'assets/images/happy_deal_1.png',
    restaurants: [
      Restaurant(
        id: '3',
        name: 'An BBQ Nguyen Van Cu',
        address: 'No. 235 Nguyen Van Cu, Nguyen Van Cu Ward, District 10, HCMC',
        discount: true,
      ),
      Restaurant(
        id: '4',
        name: 'An BBQ Vo Van Ngan',
        address: 'No. 716 Vo Van Ngan, Binh Tho Ward, Thu Duc City, HCMC',
        discount: true,
      )
    ],
  ),
];
