
import 'package:flutter/material.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class CustomFilledButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  const CustomFilledButton({
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
        ),
        backgroundColor: CustomColors.mulberry,
        foregroundColor: CustomColors.white,
      ),
    );
  }
}
