part of 'happy_deals_bloc.dart';

@immutable
sealed class HappyDealsState {}

final class HappyDealsInitial extends HappyDealsState {}

final class HappyDealsLoading extends HappyDealsState {}

/// All Data
final class HappyDealsAllDataLoaded extends HappyDealsState {}
final class HappyDealsAllDataError extends HappyDealsState {
  final String message;
  HappyDealsAllDataError(this.message);
}

///Data
final class HappyDealsDataLoaded extends HappyDealsState {
  final HappyDeal happyDeal;
  HappyDealsDataLoaded(this.happyDeal);
}
final class HappyDealsDataError extends HappyDealsState {
  final String message;
  HappyDealsDataError(this.message);
}

/// Reservation
final class HappyDealsReservationSuccess extends HappyDealsState {
  final Reservation? reservation;
  HappyDealsReservationSuccess({required this.reservation});
}
final class HappyDealsReservationError extends HappyDealsState {
  final String message;
  HappyDealsReservationError(this.message);

}