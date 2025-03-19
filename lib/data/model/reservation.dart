import 'package:ex_project/data/model/restaurant.dart';
import 'package:ex_project/data/model/user.dart';

class Reservation {
  User? user;
  Restaurant? restaurant;
  String? date;
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

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'restaurant': restaurant?.toJson(),
      'date': date,
      'numberOfPeople': numberOfPeople,
      'note': note,
      'time': time,
    };
  }
  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      restaurant: json['restaurant'] != null
          ? Restaurant.fromJson(json['restaurant'])
          : null,
      date: json['date'],
      numberOfPeople: json['numberOfPeople'],
      note: json['note'],
      time: json['time'],
    );
  }
}
