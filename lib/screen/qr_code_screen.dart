import 'package:flutter/material.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'.toUpperCase()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Generate QR Code to your paid tickets',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Divider(
                color: CustomColors.mulberry,
                thickness: 2.0,
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/details');
                },
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: CustomColors.mulberry),
                ),
                tileColor: CustomColors.white.withOpacity(0.3),
                splashColor: CustomColors.eggshell,
                dense: true,
                leading: Icon(Icons.confirmation_num_outlined,
                    color: CustomColors.coral),
                title: Text(
                  'Booking ID: 123456789',
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tour : Rinjani',
                    ),
                    Text(
                      'Booking Date : 24 Apr 2022',
                    ),
                  ],
                ),
                trailing: Column(
                  children: [
                    Expanded(
                      child: Icon(
                        Icons.fiber_manual_record,
                        color: Colors.green.shade800,
                      ),
                    ),
                    Text(
                      'Paid',
                      style: TextStyle(color: Colors.green.shade800),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
