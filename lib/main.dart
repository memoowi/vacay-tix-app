import 'package:flutter/material.dart';
import 'package:vacay_tix/screen/auth/login_screen.dart';
import 'package:vacay_tix/screen/auth/register_screen.dart';
import 'package:vacay_tix/screen/home_screen.dart';
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
        appBarTheme: AppBarTheme(
          backgroundColor: CustomColors.terracotta,
          foregroundColor: CustomColors.white,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            wordSpacing: 2,
            letterSpacing: 1,
          ),
        ),
        scaffoldBackgroundColor: CustomColors.eggshell,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
      },
      home: HomeScreen(),
    );
  }
}
