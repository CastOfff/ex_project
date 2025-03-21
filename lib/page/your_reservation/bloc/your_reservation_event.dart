part of 'your_reservation_bloc.dart';

@immutable
sealed class YourReservationEvent {}

class YourReservationFetchEvent extends YourReservationEvent{}