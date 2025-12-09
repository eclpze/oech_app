import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oech_app/authentication/password/newPassword.dart';
import 'package:oech_app/globals.dart';
import 'package:pinput/pinput.dart';

// Экран с подтверждением почты
class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  bool _isPinValid = false;
  bool _hasError = false;
  String textError = 'Пин код введен неверно';
  String text = 'Проверка пройдена!';

  void clearControllers() {
    pinController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 120),
              Row(
                children: [
                  Text(
                    'OTP Verification',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Enter the 6 digit numbers sent to your email',
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall?.copyWith(color: Color(0xffA7A7A7)),
                  ),
                  Spacer(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70, bottom: 12),
                child: Column(
                  children: [
                    Pinput(
                      controller: pinController,
                      length: 6,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      errorPinTheme: errorPinTheme,
                      autofocus: true,
                      showCursor: true,
                      separatorBuilder: (index) => SizedBox(width: 30),
                      validator: (s) {
                        return _hasError ? '' : null;
                      },
                      onChanged: (value) {
                        if (value.length == 6) {
                          if (value == '123456') {
                            setState(() {
                              _isPinValid = true;
                              _hasError = false;
                            });
                          } else {
                            setState(() {
                              _isPinValid = false;
                              _hasError = true;
                            });
                            Future.delayed(Duration(milliseconds: 1500), () {
                              if (mounted) {
                                pinController.clear();
                                setState(() {
                                  _hasError = false;
                                });
                              }
                            });
                          }
                        } else {
                          setState(() {
                            _isPinValid = false;
                            _hasError = false;
                          });
                        }
                      },
                      errorTextStyle: TextStyle(fontSize: 0),
                    ),
                    SizedBox(height: 20),
                    if (_hasError)
                      Center(
                        child: Text(
                          textError,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Color(0xffED3A3A),
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      )
                    else if (_isPinValid)
                      Center(
                        child: Text(
                          text,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                  ],
                ),
              ),
              // Недоделанный таймер
              // GestureDetector(
              //   onTap: () {},
              //   child: RichText(
              //     text: TextSpan(
              //       style: GoogleFonts.roboto(
              //         color: Color(0xffA7A7A7),
              //         fontSize: 14,
              //         fontWeight: FontWeight.w500,
              //       ),
              //       children: [
              //         TextSpan(text: 'If you didn\'t receive code, '),
              //         TextSpan(
              //           text: 'resend',
              //           style: GoogleFonts.roboto(
              //             color: Color(0xffA7A7A7),
              //             fontSize: 14,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(height: 85),
              SizedBox(
                width: 342,
                height: 46,
                child: ElevatedButton(
                  onPressed: _isPinValid
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewPassword(),
                            ),
                          );
                          clearControllers();
                        }
                      : null,
                  style:
                      ElevatedButton.styleFrom(
                        backgroundColor: _isPinValid
                            ? Color(0xff0560FA)
                            : Color(0xffA7A7A7),
                        elevation: 0,
                      ).copyWith(
                        foregroundColor: MaterialStateProperty.all(
                          Colors.white,
                        ),
                      ),
                  child: Text('Set New Password'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
