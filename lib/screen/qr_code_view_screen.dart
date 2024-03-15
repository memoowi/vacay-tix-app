import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:vacay_tix/bloc/qr_bloc.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class QRCodeViewScreen extends StatelessWidget {
  const QRCodeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'.toUpperCase()),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: BlocBuilder<QrBloc, QrState>(
          builder: (context, state) {
            if (state is QrSuccessState) {
              final qrCode = state.qrCode.data!.qrCode;
              return Column(
                children: [
                  Center(
                    child: QrImageView(
                      data: qrCode!,
                      version: 8,
                      errorCorrectionLevel: QrErrorCorrectLevel.Q,
                      eyeStyle: QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: CustomColors.terracotta,
                      ),
                      size: 320,
                      backgroundColor: CustomColors.white,
                      padding: EdgeInsets.all(20),
                      embeddedImage: AssetImage(
                        'assets/logo/logo-1-filled.png',
                      ),
                      embeddedImageStyle: QrEmbeddedImageStyle(
                        size: Size(70, 70),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'VacayTix - Scan QR code at the entrance.',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Code Access: $qrCode',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              );
            } else if (state is QrLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: CustomColors.terracotta,
                ),
              );
            } else {
              return Center(
                child: Text('Something went wrong!'),
              );
            }
          },
        ),
      ),
    );
  }
}
