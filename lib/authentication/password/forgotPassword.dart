import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:oech_app/authentication/password/verification.dart';
import 'package:oech_app/authentication/reg.dart';
import 'package:oech_app/globals.dart';

// Экран для восстановления пароля
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(updateButton);
  }

  void updateButton() {
    setState(() {
      _hasText = emailController.text.isNotEmpty;
    });
  }

  void clearControllers() {
    emailController.clear();
    setState(() {
      _hasText = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 100),
              Row(
                children: [
                  Text(
                    'Forgot Password',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Spacer(),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Enter your email address',
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall?.copyWith(color: Color(0xffA7A7A7)),
                  ),
                  Spacer(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35, bottom: 5),
                child: Row(
                  children: [
                    Text(
                      'Email Address',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Color(0xffA7A7A7),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              TextField(
                controller: emailController,
                cursorColor: Colors.black,
                cursorHeight: 20,
                decoration: InputDecoration(labelText: '***********@mail.com'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, bottom: 20),
                child: SizedBox(
                  width: 342,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_hasText) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => Verification(),
                          ),
                        );
                        clearControllers();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _hasText
                          ? Color(0xff0560FA)
                          : Color(0xffA7A7A7),
                    ),
                    child: Text('Send OTP'),
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: 'Remember password? Back to ',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: Color(0xffA7A7A7)),
                  children: [
                    TextSpan(
                      text: 'Sign in',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Color(0xff0560FA),
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => LogIn()),
                          );
                          clearControllers();
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
