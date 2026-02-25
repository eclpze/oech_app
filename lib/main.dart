import 'dart:async';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oech_app/authentication/reg.dart';
import 'package:oech_app/theme.dart';
import 'package:provider/provider.dart';
import 'globals.dart';
// создатель: Губайдуллина Камилла Рустемовна, дата и время создания: не помню((

// Точка входа в приложение
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeChange(), child: MyApp()),
  );
}

// Начальный экран с функцией удаления splash screen
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _removeSplash();
  }

  Future<void> _removeSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeChange>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme.lightTheme,
      darkTheme: DarkTheme.darkTheme,
      themeMode: themeChange.themeMode,
      home: Onboarding(),
    );
  }
}

class Onboarding extends StatefulWidget { // Экраны с начальными советами для пользователя, точка перехода на регистрацию/вход в аккаунт
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentPage = 0;

  List<String> imageList = [
    'assets/images/onboarding1.png',
    'assets/images/onboarding2.png',
    'assets/images/onboarding3.png',
  ];

  List<String> titleList = [
    'Quick Delivery At Your Doorstep',
    'Flexible Payment',
    'Real-time Tracking',
  ];

  List<String> textList = [
    'Enjoy quick pick-up and delivery to your destination',
    'Different modes of payment either before and after delivery without stress',
    'Track your packages/items from the comfort of your home till final destination',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ExpandablePageView.builder(
              onPageChanged: (int index) {
                setState(() {
                  currentPage = index;
                });
              },
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 140, bottom: 40),
                      child: Image.asset(imageList[index], height: 300),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: (currentPage == 2) ? 55 : 75,
                      ),
                      child: Column(
                        children: [
                          Text(
                            titleList[index],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: Color(0xff0560FA),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            textList[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          (currentPage == 0 || currentPage == 1)
              ? Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 80),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.animateToPage(
                        3,
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeIn,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Color(0xff0560FA)),
                    ),
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Color(0xff0560FA)),
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.nextPage(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text('Next'),
                  ),
                ),
              ],
            ),
          )
              : Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              children: [
                SizedBox(
                  width: 340,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    },
                    child: Text('Sign Up'),
                  ),
                ),
                SizedBox(height: 15),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: Theme.of(context).textTheme.titleSmall
                        ?.copyWith(color: Color(0xffA7A7A7)),
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: Theme.of(context).textTheme.titleSmall
                            ?.copyWith(
                          color: Color(0xff0560FA),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => LogIn(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
