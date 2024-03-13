import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  'assets/images/image-1.jpg',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Text(
                      'Register'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        shadows: [
                          Shadow(
                            color: Colors.white,
                            blurRadius: 20,
                          ),
                          Shadow(
                            color: Colors.black,
                            blurRadius: 10,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Register for VacayTix Today'),
                  ],
                ),
              ],
            ),
            SafeArea(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
