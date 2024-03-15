import 'package:flutter/material.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/logo-1-filled.png',
              width: 100,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 20),
            Text(
              'VacayTix',
              style: TextStyle(
                color: CustomColors.terracotta,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            ...loading(),
          ],
        ),
      ),
    );
  }

  List<Widget> loading() {
    return [
      SizedBox(height: 20),
      CircularProgressIndicator(
        color: CustomColors.terracotta,
      ),
    ];
  }
}
