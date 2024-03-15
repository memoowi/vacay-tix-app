import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vacay_tix/models/booking_list_model.dart';
import 'package:vacay_tix/utils/config.dart';

part 'booking_list_event.dart';
part 'booking_list_state.dart';

class BookingListBloc extends Bloc<BookingListEvent, BookingListState> {
  final dio = Dio();

  BookingListBloc() : super(BookingListInitialState()) {
    on<SetInitialBookingListEvent>((event, emit) async {
      emit(BookingListLoadingState());
      final bookingList = await getBookingList();
      emit(BookingListLoadedState(bookingList));
    });

    on<RefreshBookingListEvent>((event, emit) async {
      emit(BookingListLoadingState());
      final bookingList = await getBookingList();
      emit(BookingListLoadedState(bookingList));
    });
  }

  Future<BookingListModel> getBookingList() async {
    try {
      final token = await getToken();
      final response = await dio.get(
        Config.bookingUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return BookingListModel.fromJson(response.data);
      } else {
        return BookingListModel();
      }
    } on DioException catch (e) {
      print(e);
      return BookingListModel();
    }
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return token;
  }
}
