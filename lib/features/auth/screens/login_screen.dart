import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reddit/core/common/CustomReactivePasswordField.dart';
import 'package:reddit/core/common/CustomReactiveTextField.dart';
import 'package:reddit/core/common/sign_in_button.dart';
import 'package:reddit/core/constants/constants.dart';
import 'package:reddit/features/auth/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FormGroup formGroup = FormGroup({
    'email': FormControl<String>(
      validators: [
        Validators.required,
        // Validators.email,
      ],
    ),
    'password': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(6),
      ],
    ),
  });

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          Constants.logoPath,
          height: 40,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Skip",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: ReactiveFormBuilder(
            form: () => formGroup,
            builder: (context, formGroup, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Dive into anything',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                    Image.asset(
                      Constants.loginEmotePath,
                      height: 350,
                    ),
                    const SizedBox(height: 20),
                    const CustomReactiveTextField(
                        label: 'Email', formControlName: 'email'),
                    const SizedBox(height: 20),
                    const CustomReactivePasswordField(
                        label: 'Password', formControlName: 'password'),
                    const SizedBox(height: 20),
                    const SignInButton(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text("New to Reddit?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            child: const Text("Sign Up"))
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
