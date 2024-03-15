part of 'booking_list_bloc.dart';

@immutable
sealed class BookingListEvent {}

class SetInitialBookingListEvent extends BookingListEvent {}

class RefreshBookingListEvent extends BookingListEvent {}

class GetBookingListEvent extends BookingListEvent {}
