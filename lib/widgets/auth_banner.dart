import 'package:flutter/material.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class AuthBanner extends StatelessWidget {
  const AuthBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(
          'assets/images/image-1.jpg',
          height: 270,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                'Register'.toUpperCase(),
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              color: CustomColors.chestnut.withOpacity(0.8),
              child: Text(
                'Register for VacayTix Today',
                style: TextStyle(
                  color: CustomColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ],
    );
  }
}
