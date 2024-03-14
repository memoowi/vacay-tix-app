import 'package:flutter/material.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class CustomOutlineButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  const CustomOutlineButton({
    super.key,
    this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label.toUpperCase()),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: CustomColors.mulberry, width: 2.0),
        ),
        elevation: 0.0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: CustomColors.mulberry,
      ),
    );
  }
}
