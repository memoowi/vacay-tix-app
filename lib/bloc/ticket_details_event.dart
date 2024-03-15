part of 'ticket_details_bloc.dart';

@immutable
sealed class TicketDetailsEvent {}

class LoadTicketDetailsEvent extends TicketDetailsEvent {
  final int bookingId;
  LoadTicketDetailsEvent({required this.bookingId});
}

class ResetTicketDetailsEvent extends TicketDetailsEvent {}
