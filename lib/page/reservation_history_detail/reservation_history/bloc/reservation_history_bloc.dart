import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/local_storage/reservation_preferences.dart';
import '../../../../data/model/reservation/reservation.dart';



part 'reservation_history_event.dart';
part 'reservation_history_state.dart';

class ReservationHistoryBloc extends Bloc<ReservationHistoryEvent, ReservationHistoryState> {
  ReservationHistoryBloc() : super(ReservationHistoryInitial()) {
    on<ReservationHistoryFetchEvent>((event, emit) async{
      // TODO: implement event handler
      emit(ReservationHistoryLoading());
      try{
        List<Reservation> reservations = await ReservationPreferences.getReservations();
        if (reservations.isNotEmpty){
          emit(ReservationHistoryLoadingSuccess(reservations: reservations));
        } else{
          emit(ReservationHistoryLoadingFailure(error: 'No reservations found'));
        }
      } catch (e){
        if (e is Exception){
          emit(ReservationHistoryLoadingFailure(error: 'Failed to load reservations'));
        }
      }
    });
  }
}
