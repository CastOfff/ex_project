import 'package:flutter/material.dart';

import '../../../data/model/notification_model.dart';
import '../../../data/model/reservation/reservation_status.dart';

extension NotificationExtensionasdfads on NotificationModel {
  Widget getNotificationMessage() {
    switch (reservation?.reservationHistoryDetail?.statusList.last) {
      case ReservationStatus.finished:
        return RichText(
            text: TextSpan(text: 'Reservation', style: const TextStyle(color: Colors.black, fontSize: 13), children: [
          TextSpan(
              text: ' #${reservation?.id} ',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const TextSpan(text: 'has been finished successfully. ReviewNow'),
        ]));
      case ReservationStatus.pending:
        return RichText(
            text: TextSpan(text: 'Reservation', style: const TextStyle(color: Colors.black, fontSize: 13), children: [
          TextSpan(
              text: ' #${reservation?.id} ',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const TextSpan(
              text:
                  'has been booked. Please pay the deposit in time to keep your seats.\n'),
          const TextSpan(text: 'Total deposit: '),
          const TextSpan(
              text: '400.000 VND',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ]));
      case ReservationStatus.cancelled:
        return const Text('Your reservation is cancelled', style: TextStyle(fontSize: 13),); //TODO
      case ReservationStatus.deposited:
        return const Text('Your reservation is deposited', style: TextStyle(fontSize: 13),); //TODO
      case ReservationStatus.confirmed:
        return const Text('Your reservation is confirmed', style: TextStyle(fontSize: 13),); //TODO
      default:
        return const Text('Your reservation is pending', style: TextStyle(fontSize: 13),);
    }
  }
}
