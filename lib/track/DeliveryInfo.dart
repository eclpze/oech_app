import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oech_app/globals.dart';
import 'package:oech_app/home.dart';

// Экран с информацией о доставке
class Delivery extends StatefulWidget {
  const Delivery({super.key});

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  int _selectedStar = 0;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(milliseconds: 200),
      () => Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) =>
              DeliverySuccessful(),
          transitionDuration: Duration.zero,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 130, bottom: 190),
                child: Image.asset('assets/images/loading.png', width: 150),
              ),
              Text(
                'Rate Rider',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: Color(0xff0560FA),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedStar = index + 1;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Image.asset(
                          'assets/images/star.png',
                          width: 18,
                          color: index < _selectedStar
                              ? Color(0xffFF9416)
                              : Color(0xffA7A7A7),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffA7A7A7).withOpacity(0.2),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: feedbackController,
                    cursorColor: Color(0xff0560FA),
                    maxLength: 10,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset('assets/icons/feedback.svg'),
                      ),
                      hintText: 'Add feedback',
                      hintStyle: GoogleFonts.roboto(
                        color: Color(0xffCFCFCF),
                        fontSize: 14,
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 8,
                        right: 16,
                        top: 18,
                        bottom: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70),
              GestureDetector(
                onTap: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => MainPage(initialPage: 0,)));
                },
                child: Container(
                  padding: EdgeInsets.all(9),
                  width: 340,
                  height: 45,
                  decoration: BoxDecoration(color: Color(0xff0560FA)),
                  child: Text(
                    'Done',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliverySuccessful extends StatefulWidget {
  const DeliverySuccessful({super.key});

  @override
  State<DeliverySuccessful> createState() => _DeliverySuccessfulState();
}

class _DeliverySuccessfulState extends State<DeliverySuccessful> {
  int _selectedStar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 130, bottom: 65),
                child: Image.asset('assets/images/successful.png', width: 150),
              ),
              Text(
                'Delivery Successful',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: Color(0xff3A3A3A),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 67),
                child: Text(
                  'Your Item has been delivered successfully',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: Color(0xff3A3A3A),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                'Rate Rider',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: Color(0xff0560FA),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedStar = index + 1;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Image.asset(
                          'assets/images/star.png',
                          width: 18,
                          color: index < _selectedStar
                              ? Color(0xffFF9416)
                              : Color(0xffA7A7A7),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffA7A7A7).withOpacity(0.2),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: feedbackController,
                    cursorColor: Color(0xff0560FA),
                    maxLength: 10,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset('assets/icons/feedback.svg'),
                      ),
                      hintText: 'Add feedback',
                      hintStyle: GoogleFonts.roboto(
                        color: Color(0xffCFCFCF),
                        fontSize: 14,
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 8,
                        right: 16,
                        top: 18,
                        bottom: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70),
              GestureDetector(
                onTap: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => MainPage(initialPage: 0,)));
                },
                child: Container(
                  padding: EdgeInsets.all(9),
                  width: 340,
                  height: 45,
                  decoration: BoxDecoration(color: Color(0xff0560FA)),
                  child: Text(
                    'Done',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
