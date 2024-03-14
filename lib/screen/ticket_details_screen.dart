import 'package:flutter/material.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class TicketDetailsScreen extends StatelessWidget {
  const TicketDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Details'.toUpperCase()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: CustomColors.white,
            border: Border.all(
              color: CustomColors.mulberry,
              width: 1.4,
            ),
          ),
          child: Column(
            children: [
              Text(
                'Ticket Summary',
                style: TextStyle(
                  color: CustomColors.mulberry,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.confirmation_num,
                    color: CustomColors.coral,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Booking ID: 123456789',
                    style: TextStyle(
                      color: CustomColors.mulberry,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: CustomColors.coral,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Booking Date: 24 Apr 2022',
                    style: TextStyle(
                      color: CustomColors.mulberry,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.tour,
                    color: CustomColors.coral,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Booking Tour: Rinjani',
                    style: TextStyle(
                      color: CustomColors.mulberry,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.fiber_manual_record,
                    color: CustomColors.coral,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Status: Confirmed / Paid',
                    style: TextStyle(
                      color: CustomColors.mulberry,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Divider(
                color: CustomColors.mulberry,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: CustomColors.coral,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'User',
                    style: TextStyle(
                      color: CustomColors.mulberry,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.male,
                    color: CustomColors.coral,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Male',
                    style: TextStyle(
                      color: CustomColors.mulberry,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.cake,
                    color: CustomColors.coral,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '18 Years',
                    style: TextStyle(
                      color: CustomColors.mulberry,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: CustomColors.coral,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '088232220652',
                    style: TextStyle(
                      color: CustomColors.mulberry,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Divider(
                color: CustomColors.mulberry,
              ),
              SizedBox(height: 10),
              Text(
                'Payment Summary',
                style: TextStyle(
                  color: CustomColors.mulberry,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.payment,
                    color: CustomColors.coral,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Cash',
                    style: TextStyle(
                      color: CustomColors.mulberry,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    color: CustomColors.coral,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '24 Apr 2022',
                    style: TextStyle(
                      color: CustomColors.mulberry,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.payments_outlined,
                    color: CustomColors.coral,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Rp 2.000.000',
                    style: TextStyle(
                      color: CustomColors.mulberry,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/qr_code_view');
                },
                child: Text('Generate QR Code'.toUpperCase()),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: CustomColors.mulberry,
                  foregroundColor: CustomColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
