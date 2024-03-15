import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vacay_tix/models/booking_model.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class TicketDetailsPaymentSummarySection extends StatelessWidget {
  final BookingData data;
  const TicketDetailsPaymentSummarySection({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              data.payment!.paymentMethod!.toUpperCase(),
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
              DateFormat('EEE, dd MMM yyyy').format(data.payment!.paymentDate!),
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
              NumberFormat.currency(
                locale: 'id',
                symbol: 'IDR ',
                decimalDigits: 0,
              ).format(data.payment!.amount!),
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
