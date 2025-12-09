import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Файл для работы со светлой и темной темой приложения

class LightTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      cardColor: Color(0xffcccaca),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xff3A3A3A),
        ),
        headlineMedium: GoogleFonts.roboto(
          fontSize: 22,
          color: Color(0xff3A3A3A),
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: GoogleFonts.roboto(
          fontSize: 24,
          color: Color(0xff3A3A3A),
        ),
        titleLarge: GoogleFonts.roboto(fontSize: 16, color: Color(0xff3A3A3A)),
        titleMedium: GoogleFonts.roboto(fontSize: 16, color: Color(0xff3A3A3A)),
        titleSmall: GoogleFonts.roboto(fontSize: 14, color: Color(0xff3A3A3A)),
        bodyLarge: GoogleFonts.roboto(fontSize: 16,  fontWeight: FontWeight.bold,),
        bodyMedium: GoogleFonts.roboto(fontSize: 24, color: Color(0xff3A3A3A)),
        bodySmall: GoogleFonts.roboto(fontSize: 24, color: Color(0xff3A3A3A)),
        labelLarge: GoogleFonts.roboto(
          fontSize: 18,
          color: Color(0xff3A3A3A),
          fontWeight: FontWeight.bold,
        ),
        labelMedium: GoogleFonts.roboto(
          fontSize: 16,
          color: Color(0xffA7A7A7),
          fontWeight: FontWeight.bold,
        ),
        labelSmall: GoogleFonts.roboto(fontSize: 12, color: Color(0xff3A3A3A)),
      ),
      iconTheme: IconThemeData(color: Color(0xff3A3A3A)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff0560FA),
          foregroundColor: Colors.white,
          shadowColor: Colors.black.withOpacity(0.25),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          textStyle: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          enableFeedback: true,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.roboto(
          color: Color(0xffCFCFCF),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: GoogleFonts.roboto(
          color: Color(0xffCFCFCF),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffA7A7A7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffA7A7A7)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
      ),
      colorScheme: ColorScheme.light(),
    );
  }
}

class DarkTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: Color(0xff000d1d),
      canvasColor: Color(0xff011b3c),
      cardColor: Color(0xff011b3c),
      iconTheme: IconThemeData(color: Colors.white),
      scaffoldBackgroundColor: Color(0xff000d1d),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        headlineMedium: GoogleFonts.roboto(
          fontSize: 22,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: GoogleFonts.roboto(
          fontSize: 24,
          color: Colors.white,
        ),
        titleLarge: GoogleFonts.roboto(fontSize: 16, color:  Colors.white),
        titleMedium: GoogleFonts.roboto(fontSize: 16, color:  Colors.white),
        titleSmall: GoogleFonts.roboto(fontSize: 14, color:  Colors.white),
        bodyLarge: GoogleFonts.roboto(fontSize: 24, color:  Colors.white),
        bodyMedium: GoogleFonts.roboto(fontSize: 24, color:  Colors.white),
        bodySmall: GoogleFonts.roboto(fontSize: 24, color:  Colors.white),
        labelLarge: GoogleFonts.roboto(
          fontSize: 18,
          color:  Colors.white,
          fontWeight: FontWeight.bold,
        ),
        labelMedium: GoogleFonts.roboto(
          fontSize: 16,
          color:  Colors.white,
          fontWeight: FontWeight.bold,
        ),
        labelSmall: GoogleFonts.roboto(fontSize: 12, color:  Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff0560FA),
          foregroundColor: Colors.white,
          shadowColor: Colors.black.withOpacity(0.25),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          textStyle: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          enableFeedback: true,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: GoogleFonts.roboto(
          color: Color(0xffCFCFCF),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: GoogleFonts.roboto(
          color: Color(0xffCFCFCF),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffA7A7A7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffA7A7A7)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
      ),
      colorScheme: ColorScheme.light(),
    );
  }
}

// Функция переключения тем
class ThemeChange with ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
