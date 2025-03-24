part of 'review_reservation_bloc.dart';

@immutable
sealed class ReviewReservationState {}

final class ReviewReservationInitial extends ReviewReservationState {}

final class ReviewReservationId extends ReviewReservationState {
  final String id;
  ReviewReservationId({required this.id});
}
///
final class ReviewReservationLoading extends ReviewReservationState {}
final class ReviewReservationLoadingSuccess extends ReviewReservationState {
  final Reservation reservations;
  ReviewReservationLoadingSuccess({required this.reservations});
}
final class ReviewReservationLoadingFailure extends ReviewReservationState {
  final String error;
  ReviewReservationLoadingFailure({required this.error});
}

///
final class ReviewReservationSendLoading extends ReviewReservationState {}

final class ReviewReservationSendSuccess extends ReviewReservationState {
  final Reservation reservations;
  ReviewReservationSendSuccess({required this.reservations});
}

final class ReviewReservationSendFailure extends ReviewReservationState {
  final String error;
  ReviewReservationSendFailure({required this.error});
}
