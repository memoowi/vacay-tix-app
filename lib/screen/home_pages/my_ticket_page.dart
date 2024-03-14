import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vacay_tix/widgets/simple_ticket_tile.dart';

class MyTicketsPage extends StatelessWidget {
  const MyTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SimpleTicketTile(
            onTap: () {
              Navigator.pushNamed(context, '/details');
            },
            bookingId: 12,
            tourName: 'Rinjani',
            bookingDate: DateTime(2022, 4, 25),
          ),
        ],
      ),
    );
  }
}
