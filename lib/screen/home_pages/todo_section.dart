import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vacay_tix/utils/custom_colors.dart';
import 'package:vacay_tix/widgets/todo_button.dart';

class ToDo extends StatelessWidget {
  const ToDo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(40, 28, 40, 50),
      decoration: BoxDecoration(
        color: CustomColors.terracotta,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TodoButton(
            onTap: () {
              Navigator.pushNamed(context, '/discover');
            },
            icon: CupertinoIcons.compass_fill,
            label: 'Discover',
          ),
          TodoButton(
            onTap: () {
              Navigator.pushNamed(context, '/tours');
            },
            icon: Icons.landscape,
            label: 'Tour',
          ),
          TodoButton(
            onTap: () {
              Navigator.pushNamed(context, '/pending');
            },
            icon: CupertinoIcons.tickets_fill,
            label: 'Pending',
          ),
          TodoButton(
            onTap: () {
              Navigator.pushNamed(context, '/get_qr');
            },
            icon: CupertinoIcons.qrcode,
            label: 'Get QR',
          ),
        ],
      ),
    );
  }
}
