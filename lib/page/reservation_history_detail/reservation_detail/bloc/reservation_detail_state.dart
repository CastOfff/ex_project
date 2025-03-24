part of 'reservation_detail_bloc.dart';

@immutable
sealed class ReservationDetailState {}

final class ReservationDetailInitial extends ReservationDetailState {}

final class ReservationDetailLoading extends ReservationDetailState {}
final class ReservationDetailLoadingSuccess extends ReservationDetailState {
  final Reservation reservation;
  ReservationDetailLoadingSuccess({required this.reservation});
}
final class ReservationDetailLoadingFailure extends ReservationDetailState {
  final String error;
  ReservationDetailLoadingFailure({required this.error});
}