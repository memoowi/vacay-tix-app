part of 'qr_bloc.dart';

@immutable
sealed class QrEvent {}

class LoadQrCode extends QrEvent {
  final int bookingId;
  LoadQrCode({required this.bookingId});
}

class GenerateQrCode extends QrEvent {
  final int bookingId;
  final BuildContext context;
  GenerateQrCode({required this.bookingId, required this.context});
}
