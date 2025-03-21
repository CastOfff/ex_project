part of 'reservation_bloc.dart';

@immutable
sealed class ReservationState {}

final class ReservationInitial extends ReservationState {}

final class ReservationLoading extends ReservationState {}

final class ReservationFetchRestaurantSuccess extends ReservationState {
  final Restaurant? restaurant;
  ReservationFetchRestaurantSuccess({required this.restaurant});
}

final class ReservationSuccess extends ReservationState {
  final Reservation? reservation;
  ReservationSuccess({required this.reservation});
}