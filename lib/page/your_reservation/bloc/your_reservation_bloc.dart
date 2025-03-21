import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/local_storage/reservation_preferences.dart';
import '../../../data/model/reservation.dart';

part 'your_reservation_event.dart';
part 'your_reservation_state.dart';

class YourReservationBloc extends Bloc<YourReservationEvent, YourReservationState> {
  YourReservationBloc() : super(YourReservationInitial()) {
    on<YourReservationFetchEvent>((event, emit) async{
      // TODO: implement event handler
      emit(YourReservationLoading());
      try{
        List<Reservation> reservations = await ReservationPreferences.getReservations();
        if (reservations.isNotEmpty){
          emit(YourReservationLoadingSuccess(reservations: reservations));
        } else{
          emit(YourReservationLoadingFailure(error: 'No reservations found'));
        }
      } catch (e){
        if (e is Exception){
          emit(YourReservationLoadingFailure(error: 'Failed to load reservations'));
        }
      }
    });
  }
}
