part of 'review_reservation_bloc.dart';

@immutable
sealed class ReviewReservationEvent {}

class ReviewReservationFetchEvent extends ReviewReservationEvent{
  final String id;
  ReviewReservationFetchEvent(this.id);
}

class ReviewReservationSendEvent extends ReviewReservationEvent{
  final String id;
  final String rating;
  final String comment;
  final String? image;
  ReviewReservationSendEvent(this.rating, this.id, this.image, this.comment);
}