part of 'notification_bloc.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationFetchDataSuccess extends NotificationState {
  final List<NotificationModel> notifications;
  NotificationFetchDataSuccess({required this.notifications});
}

final class NotificationFetchDataError extends NotificationState {
  final String error;
  NotificationFetchDataError({required this.error});
}


final class NotificationMarkAsRead extends NotificationState {
  final NotificationModel notification;
  NotificationMarkAsRead({required this.notification});
}

final class NotificationMarkAllAsRead extends NotificationState {}


