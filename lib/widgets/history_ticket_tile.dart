import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class HistoryTicketTile extends StatelessWidget {
  final VoidCallback? onTap;
  final int bookingId;
  final String tourName;
  final DateTime bookingDate;
  final bool isCanceled;

  const HistoryTicketTile({
    super.key,
    this.onTap,
    required this.bookingId,
    required this.tourName,
    required this.bookingDate,
    this.isCanceled = false,
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
              isCanceled ? Icons.cancel : Icons.check_circle,
              color: isCanceled ? Colors.red.shade800 : Colors.green.shade800,
            ),
          ),
          Text(
            isCanceled ? 'Canceled' : 'Completed',
            style: TextStyle(
                color:
                    isCanceled ? Colors.red.shade800 : Colors.green.shade800),
          ),
        ],
      ),
    );
  }
}
