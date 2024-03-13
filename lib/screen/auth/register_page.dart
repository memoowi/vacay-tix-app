import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vacay_tix/utils/custom_colors.dart';
import 'package:vacay_tix/widgets/auth_banner.dart';
import 'package:vacay_tix/widgets/custom_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    } else if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
            AuthBanner(),
            Container(
              margin: EdgeInsets.all(32),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomFormField(
                      controller: nameController,
                      validator: nameValidator,
                      keyboardType: TextInputType.name,
                      hintText: 'Name',
                      prefixIcon: Icons.person_outline,
                    ),
                    SizedBox(height: 16),
                    CustomFormField(
                      controller: usernameController,
                      validator: usernameValidator,
                      keyboardType: TextInputType.name,
                      hintText: 'Username',
                      prefixIcon: Icons.alternate_email,
                    ),
                    SizedBox(height: 16),
                    CustomFormField(
                      controller: emailController,
                      validator: emailValidator,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'Email',
                      prefixIcon: Icons.email_outlined,
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
                    SizedBox(height: 16),
                    CustomFormField(
                      obscureText: confirmPasswordObscureText,
                      controller: confirmPasswordController,
                      validator: confirmPasswordValidator,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: 'Confirm Password',
                      prefixIcon: Icons.password_outlined,
                      suffixIcon: IconButton(
                        onPressed: toggleConfirmPasswordObscureText,
                        icon: Icon(
                          confirmPasswordObscureText
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: CustomColors.mulberry,
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Register'.toUpperCase()),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: CustomColors.mulberry,
                        foregroundColor: CustomColors.eggshell,
                      ),
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
