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
            onTap: () {},
            icon: Icons.search,
            label: 'Discover',
          ),
          TodoButton(
            onTap: () {},
            icon: Icons.tour,
            label: 'Tour',
          ),
          TodoButton(
            onTap: () {},
            icon: Icons.wallet_outlined,
            label: 'Pending',
          ),
          TodoButton(
            onTap: () {},
            icon: Icons.qr_code,
            label: 'QR Code',
          ),
        ],
      ),
    );
  }
}
