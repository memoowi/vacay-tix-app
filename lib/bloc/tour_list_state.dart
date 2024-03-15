part of 'tour_list_bloc.dart';

@immutable
sealed class TourListState {}

final class TourListInitialState extends TourListState {}

final class TourListLoadingState extends TourListState {}

final class TourListLoadedState extends TourListState {
  final List<TourData> tours;
  TourListLoadedState({required this.tours});
}
