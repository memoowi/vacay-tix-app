
import 'package:flutter/material.dart';
import 'package:vacay_tix/models/booking_model.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class TicketDetailsUserSummarySection extends StatelessWidget {
  const TicketDetailsUserSummarySection({
    super.key,
    required this.data,
  });

  final BookingData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.person,
              color: CustomColors.coral,
              size: 20,
            ),
            SizedBox(width: 10),
            Text(
              data.user!.name!.toUpperCase(),
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
              data.user!.gender!,
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
              '${data.user!.age!} Years Old',
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
              '${data.user!.phone!}',
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
