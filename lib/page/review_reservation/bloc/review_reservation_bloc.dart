import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/local_storage/reservation_preferences.dart';
import '../../../data/model/reservation/reservation.dart';

part 'review_reservation_event.dart';
part 'review_reservation_state.dart';

class ReviewReservationBloc extends Bloc<ReviewReservationEvent, ReviewReservationState> {
  ReviewReservationBloc() : super(ReviewReservationInitial()) {
    on<ReviewReservationFetchEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ReviewReservationLoading());
      try{
        List<Reservation> reservations = await ReservationPreferences.getReservations();
        Reservation reservation = reservations.firstWhere((reservation) => reservation.id == int.parse(event.id));
        if (reservations.isNotEmpty){
          emit(ReviewReservationLoadingSuccess(reservations: reservation));
        } else{
          emit(ReviewReservationLoadingFailure(error: 'No reservations found'));
        }
      } catch (e){
        if (e is Exception){
          emit(ReviewReservationLoadingFailure(error: 'Failed to load reservations'));
        }
      }
    });
  }
}
