
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class SimpleTicketTile extends StatelessWidget {
  final VoidCallback? onTap;
  final int bookingId;
  final String tourName;
  final DateTime bookingDate;

  const SimpleTicketTile({
    super.key,
    this.onTap,
    required this.bookingId,
    required this.tourName,
    required this.bookingDate,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: CustomColors.mulberry),
      ),
      tileColor: CustomColors.white.withOpacity(0.3),
      splashColor: CustomColors.eggshell,
      dense: true,
      leading: Icon(CupertinoIcons.ticket_fill, color: CustomColors.coral),
      title: Text(
        'Booking ID: $bookingId',
      ),
      subtitle: Text(
        tourName,
      ),
      trailing: Text(
        'Booking Date\n${DateFormat('EEE, dd MMM yyyy').format(bookingDate)}',
        textAlign: TextAlign.end,
      ),
    );
  }
}
