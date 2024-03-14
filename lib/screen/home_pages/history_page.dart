import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vacay_tix/widgets/history_ticket_tile.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          HistoryTicketTile(
            onTap: () {
              Navigator.pushNamed(context, '/details');
            },
            bookingId: 12,
            tourName: 'Rinjani',
            bookingDate: DateTime(2022, 4, 25),
          ),
          HistoryTicketTile(
            onTap: () {
              Navigator.pushNamed(context, '/details');
            },
            bookingId: 12,
            tourName: 'Rinjani',
            bookingDate: DateTime(2022, 4, 25),
            isCanceled: true,
          ),
        ],
      ),
    );
  }
}
