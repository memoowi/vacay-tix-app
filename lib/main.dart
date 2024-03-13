import 'package:flutter/material.dart';
import 'package:vacay_tix/screen/auth/register_page.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VacayTix',
      theme: ThemeData(
        fontFamily: 'JosefinSans',
        scaffoldBackgroundColor: CustomColors.eggshell,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}
