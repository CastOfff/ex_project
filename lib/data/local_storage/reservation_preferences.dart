import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/reservation/reservation.dart';

class ReservationPreferences {
  static const String _reservationKey = 'reservations';

  static Future<void> saveReservations(List<Reservation> reservations) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList =
    reservations.map((reservation) => jsonEncode(reservation.toJson())).toList();
    await prefs.setStringList(_reservationKey, jsonList);
  }

  static Future<void> updateReservation(Reservation reservation) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList = prefs.getStringList(_reservationKey) ?? [];
    int index = jsonList.indexWhere((jsonString) {
      final decodedJson = jsonDecode(jsonString) as Map<String, dynamic>;
      final existingReservation = Reservation.fromJson(decodedJson);
      return existingReservation.id == reservation.id;
    });
    if (index != -1) {
      jsonList[index] = jsonEncode(reservation.toJson());
      await prefs.setStringList(_reservationKey, jsonList);
    }

  }
  static Future<List<Reservation>> getReservations() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? jsonList = prefs.getStringList(_reservationKey);
    if (jsonList == null) return [];
    return jsonList
        .map((jsonString) => Reservation.fromJson(jsonDecode(jsonString)))
        .toList();
  }

  static Future<void> addReservation(Reservation reservation) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList = prefs.getStringList(_reservationKey) ?? [];

    reservation.id = jsonList.length;

    jsonList.add(jsonEncode(reservation.toJson()));

    await prefs.setStringList(_reservationKey, jsonList);
  }

  static Future<void> clearReservations() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_reservationKey);
  }
}