import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/restaurant.dart';
import '../../../data/repository/restaurant_service.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitial()) {
    on<ReservationFetchEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ReservationLoading());
      final reservation = RestaurantService().getRestaurantFromList(event.index);
      await Future.delayed(const Duration(seconds: 2));
      emit(ReservationFetchRestaurantSuccess(restaurant: reservation));
    });
  }
}
