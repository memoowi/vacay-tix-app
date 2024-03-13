import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

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
            leading: Icon(Icons.outlined_flag_sharp, color: CustomColors.coral),
            title: Text(
              'Booking ID: 123456789',
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tour : Rinjani',
                ),
                Text(
                  'Booking Date : 24 Apr 2022',
                ),
              ],
            ),
            trailing: Column(
              children: [
                Expanded(
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green.shade800,
                  ),
                ),
                Text(
                  'Completed',
                  style: TextStyle(color: Colors.green.shade800),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
