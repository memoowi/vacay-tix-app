import 'package:flutter/material.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class MyTicketsPage extends StatelessWidget {
  const MyTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            shape: RoundedRectangleBorder(
              side: BorderSide(color: CustomColors.mulberry),
            ),
            tileColor: CustomColors.white.withOpacity(0.3),
            splashColor: CustomColors.eggshell,
            dense: true,
            leading: Icon(Icons.tour, color: CustomColors.coral),
            title: Text(
              'Booking ID: 123456789',
            ),
            subtitle: Text(
              'Rinjani',
            ),
            trailing: Text(
              'Booking Date\n24 Apr 2022',
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
