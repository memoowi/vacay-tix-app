import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:vacay_tix/models/tour_list_model.dart';
import 'package:vacay_tix/models/tour_model.dart';
import 'package:vacay_tix/utils/config.dart';

part 'tour_list_event.dart';
part 'tour_list_state.dart';

class TourListBloc extends Bloc<TourListEvent, TourListState> {
  final dio = Dio();
  List<TourData> tours = [];
  TourListBloc() : super(TourListInitialState()) {
    on<LoadTourList>((event, emit) async {
      emit(TourListLoadingState());

      try {
        final response = await dio.get(Config.tourUrl);

        if (response.statusCode == 200) {
          TourListModel tourListModel = TourListModel.fromJson(response.data);

          tours = tourListModel.data!;

          emit(TourListLoadedState(tours: tours));
        } else {
          emit(TourListInitialState());
        }
      } on DioException catch (e) {
        print(e);
        emit(TourListInitialState());
      }
    });

    on<SearchTourList>((event, emit) async {
      emit(TourListLoadingState());
      final String query = event.query;
      final filteredTours = tours
          .where((tour) => tour.name!.toLowerCase().contains(query))
          .toList();

      emit(TourListLoadedState(tours: filteredTours));
    });
  }
}
