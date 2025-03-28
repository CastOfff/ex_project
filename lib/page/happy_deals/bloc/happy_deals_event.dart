part of 'happy_deals_bloc.dart';

@immutable
sealed class HappyDealsEvent {}

final class HappyDealsFetchAllDataEvent extends HappyDealsEvent {}

final class HappyDealsFetchEvent extends HappyDealsEvent {
  final HappyDeal happyDeal;
  HappyDealsFetchEvent({required this.happyDeal});
}

final class HappyDealsReservationEvent extends HappyDealsEvent {
  final Reservation? reservation;
  HappyDealsReservationEvent(this.reservation);
}