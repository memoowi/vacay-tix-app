import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vacay_tix/models/booking_model.dart';
import 'package:vacay_tix/utils/config.dart';
import 'package:vacay_tix/utils/custom_snack_bar.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final dio = Dio();

  BookingBloc() : super(BookingInitial()) {
    on<CancelBookingEvent>((event, emit) async {
      emit(BookingLoading());
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
          emit(BookingSuccess(bookingId: event.bookingId));
        }
      } on DioException catch (e) {
        print(e);
        if (event.context.mounted) {
          CustomSnackBar.show(
            context: event.context,
            message: 'Something went wrong...',
            type: Type.error,
          );
        }
      }
    });

    on<ResetBookingEvent>((event, emit) {
      emit(BookingInitial());
    });

    on<NewBookingEvent>((event, emit) async {
      emit(BookingLoading());
      try {
        final token = await getToken();

        final response = await dio.post(
          Config.bookingUrl,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
          data: {
            "tour_id": event.tourId,
            "booking_date": event.bookingDate.toString(),
          },
        );

        if (response.statusCode == 201) {
          final data = BookingModel.fromJson(response.data);
          final bookingId = data.data!.id!;
          if (event.context.mounted) {
            CustomSnackBar.show(
              context: event.context,
              message: 'Booking Successful',
              type: Type.success,
            );
          }

          emit(BookingSuccess(bookingId: bookingId));
        }
      } on DioException catch (e) {
        print(e);
        print(e.response!.data);
        if (event.context.mounted) {
          CustomSnackBar.show(
            context: event.context,
            message: 'Something went wrong...',
            type: Type.error,
          );
        }
        emit(BookingInitial());
      }
    });
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    return token;
  }
}
