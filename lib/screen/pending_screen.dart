import 'package:flutter/material.dart';
import 'package:vacay_tix/widgets/dot_ticket_tile.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Tickets'.toUpperCase()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              DotTicketTile(
                onTap: () {
                  Navigator.pushNamed(context, '/details');
                },
                bookingId: 123456789,
                tourName: 'Rinjani',
                bookingDate: DateTime(2022, 4, 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
