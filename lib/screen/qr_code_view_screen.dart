import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
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
        child: Column(
          children: [
            Center(
              child: QrImageView(
                data:
                    'dd51024d750c1d95df530cdb78201a7e64e7f22571c87b55b3e6b730d19030af',
                version: 8,
                eyeStyle: QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: CustomColors.terracotta,
                ),
                size: 320,
                backgroundColor: CustomColors.white,
                padding: EdgeInsets.all(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
