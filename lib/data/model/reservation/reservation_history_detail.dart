import 'dart:math';

import 'package:ex_project/data/model/reservation/reservation_status.dart';

class ReservationHistoryDetail {
  List<ReservationStatus> statusList;
  List<DateTime> timeLine;

  ReservationHistoryDetail({
    required this.statusList,
    required this.timeLine,
  });

  void addHistoryEntry(ReservationStatus status, DateTime dateTime) {
    statusList.add(status);
    timeLine.add(dateTime);
  }

  Map<String, dynamic> toJson() {
    return {
      'statusList': statusList.map((status) => status.name).toList(),
      'timeLine': timeLine.map((date) => date.toIso8601String()).toList(),
    };
  }

  factory ReservationHistoryDetail.fromJson(Map<String, dynamic> json) {
    return ReservationHistoryDetail(
      statusList: (json['statusList'] as List<dynamic>)
          .map((statusName) => ReservationStatus.values.byName(statusName as String))
          .toList(),
      timeLine: (json['timeLine'] as List<dynamic>)
          .map((dateString) => DateTime.parse(dateString as String))
          .toList(),
    );
  }
}

ReservationHistoryDetail mockReservationHistoryDetail1 =
    ReservationHistoryDetail(statusList: [
  ReservationStatus.reserved,
  ReservationStatus.pending,
  ReservationStatus.deposited,
  ReservationStatus.confirmed,
], timeLine: [
  DateTime.now().subtract(const Duration(days: 1)),
  DateTime.now().subtract(const Duration(days: 2)),
  DateTime.now().subtract(const Duration(days: 3)),
  DateTime.now().subtract(const Duration(days: 4)),
]);

ReservationHistoryDetail mockReservationHistoryDetail2 =
ReservationHistoryDetail(statusList: [
  ReservationStatus.reserved,
  ReservationStatus.pending,
  ReservationStatus.deposited,
  ReservationStatus.confirmed,
  ReservationStatus.finished,
], timeLine: [
  DateTime.now().subtract(const Duration(days: 1)),
  DateTime.now().subtract(const Duration(days: 2)),
  DateTime.now().subtract(const Duration(days: 3)),
  DateTime.now().subtract(const Duration(days: 4)),
  DateTime.now().subtract(const Duration(days: 5)),
]);

ReservationHistoryDetail mockReservationHistoryDetail3 =
ReservationHistoryDetail(statusList: [
  ReservationStatus.reserved,
  ReservationStatus.pending,
  ReservationStatus.deposited,
], timeLine: [
  DateTime.now().subtract(const Duration(days: 1)),
  DateTime.now().subtract(const Duration(days: 2)),
  DateTime.now().subtract(const Duration(days: 3)),
]);

ReservationHistoryDetail randomReservationHistoryDetail() {
  int randomIndex = Random().nextInt(3);
  switch (randomIndex) {
    case 0:
      return mockReservationHistoryDetail1;
    case 1:
      return mockReservationHistoryDetail2;
    case 2:
      return mockReservationHistoryDetail3;
    default:
      return mockReservationHistoryDetail1;
  }
}