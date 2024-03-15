import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vacay_tix/models/booking_model.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class TicketInfoSummarySection extends StatelessWidget {
  const TicketInfoSummarySection({
    super.key,
    required this.data,
  });

  final BookingData data;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              'Booking ID: ${data.id}',
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
              'Booking Date: ${DateFormat('EEE, dd MMM yyyy').format(data.bookingDate!)}',
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
              'Booking Tour: ${data.tour!.name}',
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
              'Status: ${data.status!.toUpperCase()}',
              style: TextStyle(
                color: CustomColors.mulberry,
              ),
            )
          ],
        ),
      ],
    );
  }
}
