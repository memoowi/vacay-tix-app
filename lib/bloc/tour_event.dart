part of 'tour_bloc.dart';

@immutable
sealed class TourEvent {}

class LoadTour extends TourEvent {
  final int tourId;

  LoadTour({required this.tourId});
}
