
import 'package:ex_project/data/model/restaurant.dart';

import '../local_storage/restaurant_list.dart';

class RestaurantService {
  Restaurant getRestaurantFromList(int index) {
    return Restaurant(
      name: restaurantList[index]['name'],
      address: restaurantList[index]['address'],
      image: restaurantList[index]['image'],
    );
  }
}