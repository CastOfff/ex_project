
import 'package:flutter/material.dart';

import '../../date_time.dart';

class DateReservationPicked extends StatefulWidget {
  final DateTime today;
  DateTime daysInMonth;
  Color backgroundColor ;
  Color borderColor;
  Color textColor;
  double borderWidth;
  DateReservationPicked({
    super.key,
    required this.today,
    required this.daysInMonth,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.borderWidth,
  });

  @override
  State<DateReservationPicked> createState() => _DateReservationPickedState();
}

class _DateReservationPickedState extends State<DateReservationPicked> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 90,
      //padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          width: widget.borderWidth,
          color: widget.borderColor
        ),
        borderRadius: BorderRadius.circular(40),
        color: widget.backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${widget.daysInMonth.day}',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
              color: widget.textColor,
            ),
          ),
          Text(
              '${weekdays[widget.daysInMonth.weekday - 1]}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: widget.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
