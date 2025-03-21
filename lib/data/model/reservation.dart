import 'package:ex_project/data/model/restaurant.dart';
import 'package:ex_project/data/model/user.dart';

class Reservation {
  int? id;
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
      required this.time,
      this.id});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user?.toJson(),
      'restaurant': restaurant?.toJson(),
      'date': date?.toIso8601String(),
      'numberOfPeople': numberOfPeople,
      'note': note,
      'time': time,
    };
  }
  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      restaurant: json['restaurant'] != null
          ? Restaurant.fromJson(json['restaurant'])
          : null,
      date: DateTime.parse(json['date']),
      numberOfPeople: json['numberOfPeople'],
      note: json['note'],
      time: json['time'],
    );
  }
}
