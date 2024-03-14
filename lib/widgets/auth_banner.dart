import 'package:flutter/material.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class AuthBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final bool? isLoginRoute;
  const AuthBanner({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.isLoginRoute = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          image,
          height: 270,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 10,
          right: 0,
          child: SafeArea(
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                color: CustomColors.mulberry,
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: Row(
                children: [
                  switchButton(
                    context,
                    'Login',
                    isSelected: isLoginRoute!,
                  ),
                  switchButton(
                    context,
                    'Register',
                    isSelected: !isLoginRoute!,
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment:
              isLoginRoute! ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title.toUpperCase(),
                style: TextStyle(
                  color: CustomColors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                      color: CustomColors.white,
                      blurRadius: 20,
                    ),
                    Shadow(
                      color: CustomColors.mulberry,
                      blurRadius: 10,
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              color: CustomColors.chestnut.withOpacity(0.8),
              child: Text(
                subtitle,
                style: TextStyle(
                  color: CustomColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: isLoginRoute! ? TextAlign.start : TextAlign.end,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ],
    );
  }

  ElevatedButton switchButton(BuildContext context, String label,
      {bool isSelected = false}) {
    return ElevatedButton(
      onPressed: isSelected
          ? null
          : () {
              if (isLoginRoute! == true) {
                Navigator.pushReplacementNamed(context, '/register');
              } else {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        minimumSize: Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(),
        backgroundColor: CustomColors.white,
        foregroundColor: CustomColors.mulberry,
        elevation: 0.0,
      ),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          color: isSelected ? CustomColors.white : CustomColors.mulberry,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}
