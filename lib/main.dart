import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vacay_tix/bloc/auth_bloc.dart';
import 'package:vacay_tix/bloc/booking_bloc.dart';
import 'package:vacay_tix/bloc/booking_list_bloc.dart';
import 'package:vacay_tix/bloc/qr_bloc.dart';
import 'package:vacay_tix/bloc/ticket_details_bloc.dart';
import 'package:vacay_tix/bloc/tour_bloc.dart';
import 'package:vacay_tix/bloc/tour_list_bloc.dart';
import 'package:vacay_tix/screen/auth/login_screen.dart';
import 'package:vacay_tix/screen/auth/register_screen.dart';
import 'package:vacay_tix/screen/discover_screen.dart';
import 'package:vacay_tix/screen/home_screen.dart';
import 'package:vacay_tix/screen/pending_screen.dart';
import 'package:vacay_tix/screen/paid_screen.dart';
import 'package:vacay_tix/screen/qr_code_view_screen.dart';
import 'package:vacay_tix/screen/splash_screen.dart';
import 'package:vacay_tix/screen/ticket_details_screen.dart';
import 'package:vacay_tix/screen/tour_details_screen.dart';
import 'package:vacay_tix/screen/tours_screen.dart';
import 'package:vacay_tix/utils/custom_colors.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(SetInitialAuthEvent()),
        ),
        BlocProvider(
          create: (context) => BookingListBloc(),
        ),
        BlocProvider(
          create: (context) => TicketDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => QrBloc(),
        ),
        BlocProvider(
          create: (context) => BookingBloc(),
        ),
        BlocProvider(
          create: (context) => TourListBloc(),
        ),
        BlocProvider(
          create: (context) => TourBloc(),
        )
      ],
      child: const MyApp(),
    ),
  );
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
        // '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/discover': (context) => DiscoverScreen(),
        '/tours': (context) => ToursScreen(),
        '/pending': (context) => PendingScreen(),
        '/get_qr': (context) => PaidScreen(),
        '/details': (context) => TicketDetailsScreen(),
        '/qr_code_view': (context) => QRCodeViewScreen(),
        '/tour_details': (context) => TourDetailsScreen(),
      },
      home: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          } else if (state is UnauthenticatedState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/login',
              (route) => false,
            );
          }
        },
        child: SplashScreen(),
      ),
    );
  }
}
