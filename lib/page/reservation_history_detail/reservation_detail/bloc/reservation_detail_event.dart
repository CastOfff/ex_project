part of 'reservation_detail_bloc.dart';

@immutable
sealed class ReservationDetailEvent {}

class ReservationDetailFetchEvent extends ReservationDetailEvent{
  final int? index;
  ReservationDetailFetchEvent({required this.index});
}