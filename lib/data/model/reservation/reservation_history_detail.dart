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