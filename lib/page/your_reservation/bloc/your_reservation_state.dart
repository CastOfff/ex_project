part of 'your_reservation_bloc.dart';

@immutable
sealed class YourReservationState {}

final class YourReservationInitial extends YourReservationState {}

final class YourReservationLoading extends YourReservationState {}

final class YourReservationLoadingSuccess extends YourReservationState {
  final List<Reservation> reservations;
  YourReservationLoadingSuccess({required this.reservations});
}

final class YourReservationLoadingFailure extends YourReservationState {
  final String error;
  YourReservationLoadingFailure({required this.error});
}