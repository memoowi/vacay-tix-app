import 'package:flutter/material.dart';
import 'package:vacay_tix/utils/custom_colors.dart';
import 'package:vacay_tix/widgets/dot_ticket_tile.dart';

class PaidScreen extends StatelessWidget {
  const PaidScreen({super.key});

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
              DotTicketTile(
                onTap: () {
                  Navigator.pushNamed(context, '/details');
                },
                bookingId: 123456789,
                tourName: 'Rinjani',
                bookingDate: DateTime(2022, 4, 25),
                isPaid: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
