import 'package:flutter/material.dart';
import 'package:vacay_tix/utils/custom_colors.dart';
import 'package:vacay_tix/widgets/auth_banner.dart';
import 'package:vacay_tix/widgets/custom_filled_button.dart';
import 'package:vacay_tix/widgets/custom_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
    } else if (!value.contains('@') || !value.contains('.')) {
      return 'Please enter a valid email';
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

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      print('Form submitted');
    }
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
        toolbarHeight: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthBanner(
              title: 'Register',
              subtitle: 'Register for VacayTix Today!',
              image: 'assets/images/register.jpg',
            ),
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
                    CustomFilledButton(
                      onPressed: submit,
                      label: 'Register',
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
