part of 'qr_bloc.dart';

@immutable
sealed class QrState {}

final class QrInitialState extends QrState {}

final class QrLoadingState extends QrState {}

final class QrSuccessState extends QrState {
  final QRCodeModel qrCode;
  QrSuccessState({required this.qrCode});
}
