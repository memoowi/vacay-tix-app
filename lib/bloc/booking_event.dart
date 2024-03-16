part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent {}

class CancelBookingEvent extends BookingEvent {
  final int bookingId;
  final BuildContext context;

  CancelBookingEvent({required this.bookingId, required this.context});
}

class NewBookingEvent extends BookingEvent {
  final int tourId;
  final DateTime bookingDate;
  final BuildContext context;

  NewBookingEvent(
      {required this.tourId, required this.bookingDate, required this.context});
}

class ResetBookingEvent extends BookingEvent {}
