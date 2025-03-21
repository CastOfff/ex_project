import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/local_storage/reservation_preferences.dart';
import '../../../data/local_storage/restaurant_list.dart';
import '../../../data/model/reservation.dart';
import '../../../data/model/restaurant.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitial()) {
    on<ReservationFetchEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ReservationLoading());
      List<Restaurant> restaurants = restaurantList.map((json) => Restaurant.fromJson(json)).toList();
      Restaurant restaurant = restaurants[event.index];
      await Future.delayed(const Duration(seconds: 2));
      emit(ReservationFetchRestaurantSuccess(restaurant: restaurant));
    });
    on<ReservationSuccessEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ReservationLoading());
      Reservation? reservation = event.reservation;
      await Future.delayed(const Duration(seconds: 2));
      emit(ReservationSuccess(reservation: reservation));
      ReservationPreferences.addReservation(reservation!);
    });
  }

}
