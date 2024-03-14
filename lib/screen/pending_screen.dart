import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

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
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/details');
                },
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: CustomColors.mulberry),
                ),
                tileColor: CustomColors.white.withOpacity(0.3),
                splashColor: CustomColors.eggshell,
                dense: true,
                leading: Icon(CupertinoIcons.ticket, color: CustomColors.coral),
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
                        Icons.fiber_manual_record,
                        color: CustomColors.coral,
                      ),
                    ),
                    Text(
                      'Unpaid',
                      style: TextStyle(color: CustomColors.coral),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
