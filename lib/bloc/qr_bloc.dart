import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vacay_tix/models/qr_code_model.dart';
import 'package:vacay_tix/utils/config.dart';
import 'package:vacay_tix/utils/custom_snack_bar.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  final dio = Dio();

  QrBloc() : super(QrInitialState()) {
    on<LoadQrCode>((event, emit) async {
      emit(QrLoadingState());

      try {
        final token = await getToken();
        final response = await dio.get(
          Config.qrCodeUrl,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
          queryParameters: {'booking_id': event.bookingId},
        );

        if (response.statusCode == 200) {
          QRCodeModel qrCode = QRCodeModel.fromJson(response.data);

          emit(QrSuccessState(qrCode: qrCode));
        } else {
          emit(QrInitialState());
        }
      } on DioException catch (e) {
        print(e);
        emit(QrInitialState());
      }
    });

    on<GenerateQrCode>((event, emit) async {
      emit(QrLoadingState());

      try {
        final token = await getToken();
        final response = await dio.put(
          Config.generateQrCodeUrl,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
          queryParameters: {'booking_id': event.bookingId},
        );

        if (response.statusCode == 200) {
          if (event.context.mounted) {
            CustomSnackBar.show(
              message: 'QR Code Generated',
              context: event.context,
              type: Type.success,
            );
          }
        } else {
          emit(QrInitialState());
        }
      } on DioException catch (e) {
        print(e);
        emit(QrInitialState());
      }
    });
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    return token;
  }
}
