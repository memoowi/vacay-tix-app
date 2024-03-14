import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class DotTicketTile extends StatelessWidget {
  final Function()? onTap;
  final int bookingId;
  final String tourName;
  final DateTime bookingDate;
  final bool isPaid;

  const DotTicketTile({
    super.key,
    this.onTap,
    required this.bookingId,
    required this.tourName,
    required this.bookingDate,
    this.isPaid = false,
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
      leading: Icon(CupertinoIcons.ticket, color: CustomColors.coral),
      title: Text(
        'Booking ID: $bookingId',
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tour : $tourName',
          ),
          Text(
            'Booking Date : ${DateFormat('EEE, dd MMM yyyy').format(bookingDate)}',
          ),
        ],
      ),
      trailing: Column(
        children: [
          Expanded(
            child: Icon(
              Icons.fiber_manual_record,
              color: isPaid ? Colors.green.shade800 : CustomColors.coral,
            ),
          ),
          Text(
            isPaid ? 'Paid' : 'Unpaid',
            style: TextStyle(
                color: isPaid ? Colors.green.shade800 : CustomColors.coral),
          ),
        ],
      ),
    );
  }
}
