import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/notification_model.dart';

class NotificationService {
  static const String _notificationKey = 'notifications';

  Future<void> saveNotification(List<NotificationModel> notifications) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList =
        notifications.map((notification) => jsonEncode(notification.toJson())).toList();
    await prefs.setStringList(_notificationKey, jsonList);
  }

  Future<List<NotificationModel>> getNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_notificationKey);
    if (jsonList == null) return [];
    final data = jsonList
        .map((jsonString) => NotificationModel.fromJson(jsonDecode(jsonString)))
        .toList();
    data;
    return data;
  }

  Future<void> addNotification(NotificationModel notification) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList = prefs.getStringList(_notificationKey) ?? [];

    notification.createdAt = DateTime.now();

    jsonList.add(jsonEncode(notification.toJson()));

    await prefs.setStringList(_notificationKey, jsonList);
  }

  Future<void> maskAsRead(int? id) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_notificationKey);
    if (jsonList == null) return;

    final List<NotificationModel> notifications = jsonList
        .map((jsonString) => NotificationModel.fromJson(jsonDecode(jsonString)))
        .toList();

    for (var notification in notifications) {
      if (notification.reservation?.id == id) {
        notification.isRead = true;
        break;
      }
    }

    final List<String> updatedJsonList =
    notifications.map((notification) => jsonEncode(notification.toJson())).toList();
    await prefs.setStringList(_notificationKey, updatedJsonList);
  }

  Future<void> maskReadAllNotification() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_notificationKey);
    if (jsonList == null) return;

    final List<NotificationModel> notifications = jsonList
        .map((jsonString) => NotificationModel.fromJson(jsonDecode(jsonString)))
        .toList();

    for (var notification in notifications) {
      notification.isRead = true;
    }

    final List<String> updatedJsonList =
    notifications.map((notification) => jsonEncode(notification.toJson())).toList();
    await prefs.setStringList(_notificationKey, updatedJsonList);
  }

  Future<void> clearNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_notificationKey);
  }
}
