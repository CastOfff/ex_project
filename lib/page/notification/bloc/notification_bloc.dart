import 'package:bloc/bloc.dart';
import 'package:ex_project/data/repository/notification_service.dart';
import 'package:meta/meta.dart';

import '../../../data/model/notification_model.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationFetchEvent>((event, emit) async{
      // TODO: implement event handler
      emit(NotificationLoading());
      try {
        List<NotificationModel> notifications = await NotificationService().getNotifications();
        if (notifications.isNotEmpty) {
          emit(NotificationFetchDataSuccess(notifications: notifications));
        } else {
          emit(NotificationFetchDataError(error: 'No notifications found'));
        }
      } catch (e) {
        if (e is Exception) {
          emit(NotificationFetchDataError(error: 'Failed to load notifications'));
        }
      }
    });

    on<NotificationMarkAsReadEvent>((event, emit) async {
      emit(NotificationMarkAsRead(notification: event.notification));
      await NotificationService().maskAsRead(event.notification.reservation?.id);
      List<NotificationModel> updatedNotifications = await NotificationService().getNotifications();
      emit(NotificationFetchDataSuccess(notifications: updatedNotifications));
    });

    on<NotificationMarkAllAsReadEvent>((event, emit) async {
      emit(NotificationMarkAllAsRead());
      await NotificationService().maskReadAllNotification();
      List<NotificationModel> updatedNotifications = await NotificationService().getNotifications();
      emit(NotificationFetchDataSuccess(notifications: updatedNotifications));
    });
  }
}

