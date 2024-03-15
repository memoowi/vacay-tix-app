part of 'tour_list_bloc.dart';

@immutable
sealed class TourListEvent {}

class LoadTourList extends TourListEvent {}

class SearchTourList extends TourListEvent {
  final String query;
  SearchTourList(this.query);
}
