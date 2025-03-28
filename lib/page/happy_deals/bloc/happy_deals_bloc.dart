import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/local_storage/reservation_preferences.dart';
import '../../../data/model/happy_deal.dart';
import '../../../data/model/reservation/reservation.dart';

part 'happy_deals_event.dart';
part 'happy_deals_state.dart';

class HappyDealsBloc extends Bloc<HappyDealsEvent, HappyDealsState> {
  HappyDealsBloc() : super(HappyDealsInitial()) {
    on<HappyDealsFetchAllDataEvent>((event, emit) async{
      // TODO: implement event handler
      emit(HappyDealsLoading());
      await Future.delayed(const Duration(seconds: 1));
      if (mockHappyDeals.isNotEmpty){
        emit(HappyDealsAllDataLoaded());
        return;
      } else {
        emit(HappyDealsAllDataError('Lỗi'));
        return;
      }
    });
    on<HappyDealsFetchEvent>((event, emit){
      // TODO: implement event handler
      emit(HappyDealsLoading());
      emit(HappyDealsDataLoaded(event.happyDeal));
      // emit(HappyDealsAllDataError('Lỗi'));
    });
    on<HappyDealsReservationEvent>((event, emit) async {
      // TODO: implement event handler
      emit(HappyDealsLoading());
      Reservation? reservation = event.reservation;
      await Future.delayed(const Duration(seconds: 2));
      emit(HappyDealsReservationSuccess(reservation: reservation));
      ReservationPreferences.addReservation(reservation!);
    });
  }
}
