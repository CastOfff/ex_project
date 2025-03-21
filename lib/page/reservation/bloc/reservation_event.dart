part of 'reservation_bloc.dart';

@immutable
sealed class ReservationEvent {}

class ReservationFetchEvent extends ReservationEvent{
  final int index;
  ReservationFetchEvent(this.index);
}

class ReservationSuccessEvent extends ReservationEvent{
  final Reservation? reservation;
  ReservationSuccessEvent(this.reservation);
}
