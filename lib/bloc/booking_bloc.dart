import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vacay_tix/utils/config.dart';
import 'package:vacay_tix/utils/custom_snack_bar.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final dio = Dio();

  BookingBloc() : super(BookingInitial()) {
    on<CancelBookingEvent>((event, emit) async {
      try {
        final token = await getToken();
        final response = await dio.patch(
          Config.bookingUrl,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
          data: {"booking_id": event.bookingId},
        );

        if (response.statusCode == 200) {
          if (event.context.mounted) {
            CustomSnackBar.show(
              context: event.context,
              message: 'Booking Canceled',
              type: Type.success,
            );
          }
          // emit(CancelBookingSuccess());
        } else {
          // emit(CancelBookingFailure());
        }
      } on DioException catch (e) {
        print(e);
        // emit(CancelBookingFailure());
      }
    });
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    return token;
  }
}
