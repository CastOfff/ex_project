part of 'reservation_history_bloc.dart';

@immutable
sealed class ReservationHistoryEvent {}

class ReservationHistoryFetchEvent extends ReservationHistoryEvent{}