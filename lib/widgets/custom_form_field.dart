import 'package:flutter/material.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String hintText;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;

  const CustomFormField({
    super.key,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: CustomColors.chestnut,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Icon(prefixIcon),
        prefixIconColor: CustomColors.mulberry,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: CustomColors.mulberry,
            width: 2,
          ),
        ),
      ),
      style: TextStyle(
        color: CustomColors.mulberry,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
