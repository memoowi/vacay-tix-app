import 'package:flutter/material.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class HomeListButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final bool isSelected;

  const HomeListButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? CustomColors.terracotta : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(),
            foregroundColor: CustomColors.mulberry,
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
