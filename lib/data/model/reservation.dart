import 'package:ex_project/data/model/restaurant.dart';
import 'package:ex_project/data/model/user.dart';

class Reservation {
  User? user;
  Restaurant? restaurant;
  DateTime? date;
  int? numberOfPeople;
  String? note;
  String? time;

  Reservation(
      {required this.user,
      required this.restaurant,
      required this.date,
      required this.numberOfPeople,
      required this.note,
      required this.time});
}
