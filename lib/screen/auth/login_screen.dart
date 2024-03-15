import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vacay_tix/bloc/auth_bloc.dart';
import 'package:vacay_tix/utils/custom_colors.dart';
import 'package:vacay_tix/widgets/auth_banner.dart';
import 'package:vacay_tix/widgets/custom_filled_button.dart';
import 'package:vacay_tix/widgets/custom_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool passwordObscureText = true;
  bool confirmPasswordObscureText = true;
  void togglePasswordObscureText() {
    setState(() {
      passwordObscureText = !passwordObscureText;
    });
  }

  void toggleConfirmPasswordObscureText() {
    setState(() {
      confirmPasswordObscureText = !confirmPasswordObscureText;
    });
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    } else if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            LoginEvent(
                username: usernameController.text,
                password: passwordController.text,
                context: context),
          );
    }
    // Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthBanner(
              title: 'Login',
              subtitle: 'VacayTix? Ready, Set, Explore!',
              image: 'assets/images/login.jpg',
              isLoginRoute: true,
            ),
            Container(
              margin: EdgeInsets.all(32),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormField(
                      controller: usernameController,
                      validator: usernameValidator,
                      keyboardType: TextInputType.name,
                      hintText: 'Username',
                      prefixIcon: Icons.alternate_email,
                    ),
                    SizedBox(height: 16),
                    CustomFormField(
                      obscureText: passwordObscureText,
                      controller: passwordController,
                      validator: passwordValidator,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: 'Password',
                      prefixIcon: Icons.lock_outline,
                      suffixIcon: IconButton(
                        onPressed: togglePasswordObscureText,
                        icon: Icon(
                          passwordObscureText
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: CustomColors.mulberry,
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    CustomFilledButton(
                      onPressed: submit,
                      label: 'Login',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
