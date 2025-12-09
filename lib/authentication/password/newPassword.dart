import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oech_app/authentication/reg.dart';
import 'package:oech_app/globals.dart';

// Экран для ввода нового пароля
class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool _isPassword = true;
  bool _isConfirm = true;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    passwordController.addListener(updateButton);
    passwordConfirmController.addListener(updateButton);
  }

  void updateButton() {
    setState(() {
      _hasText = passwordController.text.isNotEmpty && passwordConfirmController.text.isNotEmpty;
    });
  }

  void clearControllers() {
    passwordController.clear();
    passwordConfirmController.clear();
    setState(() {
      _hasText = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                SizedBox(height: 100),
                Row(
                  children: [
                    Text(
                      'New Password',
                      style: Theme.of(context).textTheme.headlineLarge
                    ),
                    Spacer(),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Enter new password',
                      style: Theme.of(context).textTheme.titleSmall
                          ?.copyWith(color: Color(0xffA7A7A7)),
                    ),
                    Spacer(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 5),
                  child: Row(
                    children: [
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.titleSmall
                            ?.copyWith(
                          color: Color(0xffA7A7A7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                TextField(
                  controller: passwordController,
                  cursorColor: Colors.black,
                  cursorHeight: 20,
                  obscureText: _isPassword,
                  decoration: InputDecoration(
                    labelText: '**********',
                    suffixIcon: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          _isPassword = !_isPassword;
                        });
                      },
                      icon: SvgPicture.asset(
                        _isPassword
                            ? 'assets/icons/eye-slash.svg'
                            : 'assets/icons/eye.svg',
                        width: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 5),
                  child: Row(
                    children: [
                      Text(
                        'Confirm Password',
                        style: Theme.of(context).textTheme.titleSmall
                            ?.copyWith(
                          color: Color(0xffA7A7A7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                TextField(
                  controller: passwordConfirmController,
                  cursorColor: Colors.black,
                  cursorHeight: 20,
                  obscureText: _isConfirm,
                  decoration: InputDecoration(
                    labelText: '**********',
                    suffixIcon: IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        setState(() {
                          _isConfirm = !_isConfirm;
                        });
                      },
                      icon: SvgPicture.asset(
                        _isConfirm
                            ? 'assets/icons/eye-slash.svg'
                            : 'assets/icons/eye.svg',
                        width: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70, bottom: 20),
                  child: SizedBox(
                    width: 342,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_hasText) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => LogIn()),
                          );
                          clearControllers();
                        };
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _hasText
                            ? Color(0xff0560FA)
                            : Color(0xffA7A7A7),
                      ),
                      child: Text('Log in'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
