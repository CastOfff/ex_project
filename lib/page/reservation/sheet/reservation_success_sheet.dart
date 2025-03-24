
import 'package:ex_project/data/model/reservation/reservation_status.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/verify_common_button.dart';
import '../../../data/model/reservation/reservation.dart';

class ReservationSuccessSheet extends StatefulWidget {
  final Reservation reservation;
  const ReservationSuccessSheet({super.key, required this.reservation});

  @override
  State<ReservationSuccessSheet> createState() => _ReservationSuccessSheetState();
}

class _ReservationSuccessSheetState extends State<ReservationSuccessSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset('assets/images/tick_xanh.png'),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Your reservation is confirmed!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
            const SizedBox(
             height: 16,
            ),
            Text(
              'Your deposit for Reservation #${widget.reservation.id} is 200.000VND. \nDo you want to pay now?',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            VerifyCommonButton(
              onPressed: () {

              },
              title: 'PAYMENT',
            ),
            const SizedBox(
              height: 16,
            ),
            Text('${widget.reservation.reservationHistoryDetail?.statusList.last.convertToString} - ${widget.reservation.reservationHistoryDetail?.timeLine.last}'),
            const Spacer(),
            const Text(
              'Note: If the customer cancels the reservation due to subjective reasons, the restaurant will not be responsible for refunding the deposit.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    );
  }
}
