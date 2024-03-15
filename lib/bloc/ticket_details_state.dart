part of 'ticket_details_bloc.dart';

@immutable
sealed class TicketDetailsState {}

final class TicketDetailsInitialState extends TicketDetailsState {}

final class TicketDetailsLoadingState extends TicketDetailsState {}

final class TicketDetailsLoadedState extends TicketDetailsState {
  final BookingModel bookingModel;
  TicketDetailsLoadedState({required this.bookingModel});
}
