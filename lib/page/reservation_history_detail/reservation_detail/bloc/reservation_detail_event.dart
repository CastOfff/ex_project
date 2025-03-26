part of 'reservation_detail_bloc.dart';

@immutable
sealed class ReservationDetailEvent {}

class ReservationDetailFetchEvent extends ReservationDetailEvent{
  final int? index;
  ReservationDetailFetchEvent({required this.index});
}

class ReservationSendReviewEvent extends ReservationDetailEvent{
  final Reservation reservation;
  ReservationSendReviewEvent({required this.reservation});
}