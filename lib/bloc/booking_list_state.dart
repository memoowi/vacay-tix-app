part of 'booking_list_bloc.dart';

@immutable
sealed class BookingListState {}

final class BookingListInitialState extends BookingListState {}

final class BookingListLoadingState extends BookingListState {}

final class BookingListLoadedState extends BookingListState {
  final BookingListModel bookingList;
  BookingListLoadedState(this.bookingList);
}
