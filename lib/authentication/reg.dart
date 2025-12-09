import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oech_app/authentication/password/forgotPassword.dart';
import 'package:oech_app/home.dart';
import 'package:pinput/pinput.dart';
import '../globals.dart';

// Экран создания нового аккаунта
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isPassword = true;
  bool _isConfirm = true;
  bool _isAgree = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    nameController.addListener(updateButton);
    phoneNumberController.addListener(updateButton);
    emailController.addListener(updateButton);
    passwordController.addListener(updateButton);
    passwordConfirmController.addListener(updateButton);
  }

  void updateButton() {
    setState(() {
      _hasText =
          nameController.text.isNotEmpty &&
          phoneNumberController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          passwordConfirmController.text.isNotEmpty &&
          _isAgree == true;
    });
  }

  void toggleAgreement() {
    setState(() {
      _isAgree = !_isAgree;
      updateButton();
    });
  }

  // Валидация данных
  void validatorData() {
    if (nameController.text == nameController.text.toLowerCase() &&
        emailController.text.contains("@") &&
        phoneNumberController.text.contains("+7") &&
        passwordController.text == passwordConfirmController.text &&
        _hasText) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainPage(initialPage: 0)),
      );
      clearControllers();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Ошибка',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            content: Text(
              'Данные неверно введены',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(color: Colors.redAccent),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Ну не',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Еще раз',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          );
        },
      );
    }
  }

  void clearControllers() {
    nameController.clear();
    phoneNumberController.clear();
    emailController.clear();
    passwordController.clear();
    passwordConfirmController.clear();
    setState(() {
      _hasText = false;
      _isAgree = false;
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
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 5),
                  child: Row(
                    children: [
                      Text(
                        'Create an account',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Complete the sign up process to get started',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Color(0xffA7A7A7),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 10),
                  child: Row(
                    children: [
                      Text(
                        'Full name',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Color(0xffA7A7A7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  width: 400,
                  height: 45,
                  child: TextField(
                    controller: nameController,
                    cursorColor: Colors.black,
                    cursorHeight: 20,
                    decoration: InputDecoration(labelText: 'Ivanov Ivan'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 5),
                  child: Row(
                    children: [
                      Text(
                        'Phone Number',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Color(0xffA7A7A7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  width: 400,
                  height: 45,
                  child: TextField(
                    controller: phoneNumberController,
                    cursorHeight: 20,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(labelText: '+7(999)999-99-99'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 5),
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
                SizedBox(
                  width: 400,
                  height: 45,
                  child: TextField(
                    controller: emailController,
                    cursorHeight: 20,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelText: '***********@mail.com',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 5),
                  child: Row(
                    children: [
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Color(0xffA7A7A7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  width: 400,
                  height: 45,
                  child: TextField(
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
                          width: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 5),
                  child: Row(
                    children: [
                      Text(
                        'Confirm Password',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Color(0xffA7A7A7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  width: 400,
                  height: 45,
                  child: TextField(
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
                          width: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                CheckboxListTile(
                  activeColor: Color(0xff0560FA),
                  side: BorderSide(color: Color(0xff0560FA)),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'By ticking this box, you agree to our ',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Color(0xffA7A7A7),
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms and conditions and private policy',
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(color: Color(0xffEBBC2E)),
                        ),
                      ],
                    ),
                  ),
                  value: _isAgree,
                  onChanged: (bool? value) {
                    toggleAgreement();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 342,
                        height: 46,
                        child: ElevatedButton(
                          onPressed: () {
                            validatorData();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _hasText
                                ? Color(0xff0560FA)
                                : Color(0xffA7A7A7),
                          ),
                          child: Text('Sign Up'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        child: RichText(
                          text: TextSpan(
                            text: 'Already have an account? ',
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: Color(0xffA7A7A7)),
                            children: [
                              TextSpan(
                                text: 'Sign in',
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(color: Color(0xff0560FA)),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => LogIn(),
                                      ),
                                    );
                                    clearControllers();
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'or sign in using',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Color(0xffA7A7A7),
                        ),
                      ),
                      SizedBox(height: 10),
                      Image.asset('assets/images/google.png', width: 20),
                    ],
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

// Экран входа в аккаунт
class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _isPasswordLog = true;
  bool _isRemember = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(updateButton);
    passwordController.addListener(updateButton);
  }

  void updateButton() {
    setState(() {
      _hasText =
          emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  void validatorData() {
    if (emailController.text.contains("@") && _hasText) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainPage(initialPage: 0)),
      );
      clearControllers();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Ошибка',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            content: Text(
              'Данные неверно введены',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(color: Colors.redAccent),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Ну не',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Еще раз',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          );
        },
      );
    }
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    setState(() {
      _hasText = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Верхняя часть с Textfield
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100, bottom: 5),
                        child: Row(
                          children: [
                            Text(
                              'Welcome Back',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Fill in your email and password to continue',
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: Color(0xffA7A7A7)),
                          ),
                          Spacer(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 5),
                        child: Row(
                          children: [
                            Text(
                              'Email Address',
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
                        controller: emailController,
                        cursorColor: Colors.black,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          labelText: '***********@mail.com',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 5),
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
                        obscureText: _isPasswordLog,
                        decoration: InputDecoration(
                          labelText: '**********',
                          suffixIcon: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                _isPasswordLog = !_isPasswordLog;
                              });
                            },
                            icon: SvgPicture.asset(
                              _isPasswordLog
                                  ? 'assets/icons/eye-slash.svg'
                                  : 'assets/icons/eye.svg',
                              width: 20,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Color(0xff0560FA),
                            side: BorderSide(color: Color(0xffA7A7A7)),
                            value: _isRemember,
                            onChanged: (bool? value) {
                              setState(() {
                                _isRemember = value ?? false;
                              });
                            },
                          ),
                          Text(
                            'Remember password',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: Color(0xffA7A7A7),
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => ForgotPassword(),
                                ),
                              );
                              clearControllers();
                            },
                            child: Text(
                              'Forgot Password?',
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    color: Color(0xff0560FA),
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Нижняя часть с кнопкой
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        width: 342,
                        height: 46,
                        child: ElevatedButton(
                          onPressed: () {
                           validatorData();
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
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 10),
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(color: Color(0xffA7A7A7)),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(
                                    color: Color(0xff0560FA),
                                    fontWeight: FontWeight.bold,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => SignUp(),
                                    ),
                                  );
                                  clearControllers();
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'or sign in using',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Color(0xffA7A7A7),
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.asset('assets/images/google.png', width: 20),
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
