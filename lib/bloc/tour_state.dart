part of 'tour_bloc.dart';

@immutable
sealed class TourState {}

final class TourInitialState extends TourState {}

final class TourLoadingState extends TourState {}

final class TourLoadedState extends TourState {
  final TourModel tourModel;

  TourLoadedState({required this.tourModel});
}
