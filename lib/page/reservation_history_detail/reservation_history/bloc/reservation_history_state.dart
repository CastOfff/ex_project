part of 'reservation_history_bloc.dart';

@immutable
sealed class ReservationHistoryState {}

final class ReservationHistoryInitial extends ReservationHistoryState {}

final class ReservationHistoryLoading extends ReservationHistoryState {}

final class ReservationHistoryLoadingSuccess extends ReservationHistoryState {
  final List<Reservation> reservations;
  ReservationHistoryLoadingSuccess({required this.reservations});
}

final class ReservationHistoryLoadingFailure extends ReservationHistoryState {
  final String error;
  ReservationHistoryLoadingFailure({required this.error});
}