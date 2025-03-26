import 'package:ex_project/data/model/reservation/reservation_history_detail.dart';
import 'package:ex_project/data/model/restaurant.dart';
import 'package:ex_project/data/model/user.dart';


class Reservation {
  int? id;
  User? user;
  Restaurant? restaurant;
  DateTime? date;
  DateTime? orderTime;
  int? numberOfPeople;
  String? note;
  String? time;
  double? rating;
  String? image;
  String? comment;
  ReservationHistoryDetail? reservationHistoryDetail;

  Reservation(
      {required this.user,
      required this.restaurant,
      required this.date,
      this.orderTime,
      required this.numberOfPeople,
      required this.note,
      required this.time,
      this.id,
      this.rating,
      this.image,
      this.comment,
      this.reservationHistoryDetail});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user?.toJson(),
      'restaurant': restaurant?.toJson(),
      'date': date?.toIso8601String(),
      'orderTime': orderTime?.toIso8601String(),
      'numberOfPeople': numberOfPeople,
      'note': note,
      'time': time,
      'rating': rating,
      'image': image,
      'comment': comment,
      'reservationHistoryDetail': reservationHistoryDetail?.toJson(),
    };
  }
  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      restaurant: json['restaurant'] != null
          ? Restaurant.fromJson(json['restaurant'])
          : null,
      date: DateTime.tryParse(json['date']),
      orderTime: DateTime.tryParse(json['orderTime'] ?? ''),
      numberOfPeople: json['numberOfPeople'],
      note: json['note'],
      time: json['time'],
      rating: json['rating'],
      image: json['image'],
      comment: json['comment'],
      reservationHistoryDetail: json['reservationHistoryDetail'] != null
          ? ReservationHistoryDetail.fromJson(json['reservationHistoryDetail'])
          : null,
    );
  }
}
