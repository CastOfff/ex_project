part of 'notification_bloc.dart';

@immutable
sealed class NotificationEvent {}

class NotificationFetchEvent extends NotificationEvent {
  // final List<NotificationModel> notifications;
  // NotificationFetchEvent({required this.notifications});
}

class NotificationMarkAsReadEvent extends NotificationEvent {
  final NotificationModel notification;
  NotificationMarkAsReadEvent({required this.notification});
}

class NotificationMarkAllAsReadEvent extends NotificationEvent {
}