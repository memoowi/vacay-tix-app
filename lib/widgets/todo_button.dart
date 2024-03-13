import 'package:flutter/material.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class TodoButton extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final String label;

  const TodoButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CustomColors.mulberry,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: CustomColors.white,
                width: 2,
              ),
            ),
            child: Icon(
              icon,
              color: CustomColors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              color: CustomColors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
