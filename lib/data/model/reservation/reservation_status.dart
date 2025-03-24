enum ReservationStatus {
  reserved,
  pending,
  deposited,
  confirmed,
  finished,
  cancelled
}

extension ReservationStatusExt on ReservationStatus {
  String convertToString(){
    switch (this) {
      case ReservationStatus.reserved:
        return 'Reserved';
      case ReservationStatus.pending:
        return 'Pending';
      case ReservationStatus.deposited:
        return 'Deposited';

      case ReservationStatus.confirmed:
        return 'Confirmed';

      case ReservationStatus.finished:
        return 'Finished';
      default:
        return 'Cancelled';
    }
  }
}

extension ReservationStatusFromString on String?{
  ReservationStatus convertToReservationState(){
    switch(this){
      case 'Reserved': return ReservationStatus.reserved;
      case 'Pending': return ReservationStatus.pending;
      case 'Deposited': return ReservationStatus.deposited;
      case 'Confirmed': return ReservationStatus.confirmed;
      case 'Finished': return ReservationStatus.finished;
      default: return ReservationStatus.cancelled;
    }
  }
}