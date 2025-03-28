import 'package:ex_project/data/model/reservation/reservation.dart';
import 'package:ex_project/data/model/reservation/reservation_history_detail.dart';
import 'package:ex_project/data/model/reservation/reservation_status.dart';
import 'package:ex_project/data/model/restaurant.dart';
import 'package:ex_project/data/model/user.dart';

class NotificationModel {
  final Reservation? reservation;
  bool isRead;
  late final DateTime? createdAt;

  NotificationModel({this.reservation, this.isRead = false, this.createdAt});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      reservation: Reservation.fromJson(json['reservation']),
      isRead: json['isRead'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reservation': reservation?.toJson(),
      'isRead': isRead,
      'createdAt': createdAt?.toIso8601String(),
    };
  }
}


/// MOCK
List<NotificationModel> mockNotifications = [
  NotificationModel(
    reservation: Reservation(
      id: 1,
      user: User(id: '101', name: "Nguyễn Văn A"),
      restaurant: Restaurant(id: '1', name: "Nhà hàng ABC", address: ''),
      date: DateTime.now(),
      numberOfPeople: 4,
      note: "Bàn gần cửa sổ",
      time: "19:00",
      reservationHistoryDetail: ReservationHistoryDetail(
        statusList: [ReservationStatus.finished], timeLine: [DateTime.now()]
      )
    ),
    isRead: false,
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
  ),
  NotificationModel(
    reservation: Reservation(
      id: 2,
      user: User(id: '102', name: "Trần Thị B"),
      restaurant: Restaurant(id: '2', name: "Nhà hàng XYZ", address: ''),
      date: DateTime.now(),
      numberOfPeople: 2,
      note: "Ăn chay",
      time: "18:30",
        reservationHistoryDetail: ReservationHistoryDetail(
            statusList: [ReservationStatus.cancelled], timeLine: [DateTime.now()]
        )
    ),
    isRead: false,
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
  ),
  NotificationModel(
    reservation: Reservation(
      id: 3,
      user: User(id: '103', name: "Lê Văn C"),
      restaurant: Restaurant(id: '3',name: "Nhà hàng 123", address: ''),
      date: DateTime.now(),
      numberOfPeople: 6,
      note: "Sinh nhật",
      time: "20:00",
        reservationHistoryDetail: ReservationHistoryDetail(
            statusList: [ReservationStatus.pending], timeLine: [DateTime.now()]
        )
    ),
    isRead: false,
    createdAt: DateTime.now().subtract(const Duration(hours: 5)),
  ),
  NotificationModel(
    reservation: Reservation(
      id: 4,
      user: User(id: '104', name: "Phạm Thị D"),
      restaurant: Restaurant(id: '4',name: "Nhà hàng QWE", address: ''),
      date: DateTime.now(),
      numberOfPeople: 3,
      note: "Gọi trước món ăn",
      time: "17:45",
        reservationHistoryDetail: ReservationHistoryDetail(
            statusList: [ReservationStatus.confirmed], timeLine: [DateTime.now()]
        )
    ),
    isRead: false,
    createdAt: DateTime.now().subtract(const Duration(days: 3)),
  ),
  NotificationModel(
    reservation: Reservation(
      id: 5,
      user: User(id: '105', name: "Hoàng Văn E"),
      restaurant: Restaurant(id: '5',name: "Nhà hàng ASD", address: ''),
      date: DateTime.now(),
      numberOfPeople: 5,
      note: "Gặp gỡ đối tác",
      time: "21:00",
        reservationHistoryDetail: ReservationHistoryDetail(
            statusList: [ReservationStatus.deposited], timeLine: [DateTime.now()]
        )
    ),
    isRead: false,
    createdAt: DateTime.now().subtract(const Duration(hours: 10)),
  ),
];

