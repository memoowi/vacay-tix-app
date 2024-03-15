import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vacay_tix/models/booking_model.dart';
import 'package:vacay_tix/utils/config.dart';

part 'ticket_details_event.dart';
part 'ticket_details_state.dart';

class TicketDetailsBloc extends Bloc<TicketDetailsEvent, TicketDetailsState> {
  final dio = Dio();
  TicketDetailsBloc() : super(TicketDetailsInitialState()) {
    on<LoadTicketDetailsEvent>((event, emit) async {
      try {
        emit(TicketDetailsLoadingState());
        final token = await getToken();
        final response = await dio.get(
          Config.bookingDetailsUrl,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
          queryParameters: {'booking_id': event.bookingId},
        );

        if (response.statusCode == 200) {
          final data = BookingModel.fromJson(response.data);

          emit(TicketDetailsLoadedState(bookingModel: data));
        }
      } on DioException catch (e) {
        print(e);
        emit(TicketDetailsInitialState());
      }
    });

    on<ResetTicketDetailsEvent>((event, emit) {
      emit(TicketDetailsInitialState());
    });
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    return token;
  }
}
