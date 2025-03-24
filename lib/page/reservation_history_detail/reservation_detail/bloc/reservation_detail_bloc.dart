import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/local_storage/reservation_preferences.dart';
import '../../../../data/model/reservation/reservation.dart';

part 'reservation_detail_event.dart';
part 'reservation_detail_state.dart';

class ReservationDetailBloc extends Bloc<ReservationDetailEvent, ReservationDetailState> {
  ReservationDetailBloc() : super(ReservationDetailInitial()) {
    on<ReservationDetailFetchEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ReservationDetailLoading());
      try{
        List<Reservation> reservations = await ReservationPreferences.getReservations();
        Reservation reservation = reservations.firstWhere((element) => element.id == event.index);
        if (reservations.isNotEmpty){
          emit(ReservationDetailLoadingSuccess(reservation: reservation));
        } else{
          emit(ReservationDetailLoadingFailure(error: 'No reservations found'));
        }
      } catch (e){
        if (e is Exception){
          emit(ReservationDetailLoadingFailure(error: 'Failed to load reservations'));
        }
      }
    });
  }
}
