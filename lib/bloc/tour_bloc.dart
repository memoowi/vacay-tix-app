import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:vacay_tix/models/tour_model.dart';
import 'package:vacay_tix/utils/config.dart';

part 'tour_event.dart';
part 'tour_state.dart';

class TourBloc extends Bloc<TourEvent, TourState> {
  final dio = Dio();

  TourBloc() : super(TourInitialState()) {
    on<LoadTour>((event, emit) async {
      emit(TourLoadingState());

      try {
        final response = await dio
            .get(Config.tourUrl, queryParameters: {'id': event.tourId});

        if (response.statusCode == 200) {
          TourModel tourModel = TourModel.fromJson(response.data);
          emit(TourLoadedState(tourModel: tourModel));
        } else {
          emit(TourInitialState());
        }
      } on DioException catch (e) {
        print(e);
        emit(TourInitialState());
      }
    });
  }
}
