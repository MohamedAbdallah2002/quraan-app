import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quraan_app/models/quran_data.dart';
import 'package:quraan_app/view/screen/surah_list_screen.dart';

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'القرآن الكريم',
      locale: const Locale('ar', 'SA'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'SA'),
      ],
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF125D98), // Deep blue
          secondary: Color(0xFF1C82AD), // Bright teal
          tertiary: Color(0xFFF2C335),  // Soft golden yellow
          surface: Color(0xFFF6F9FC),  // Light blue-gray
          onSurface: Color(0xFF0D1B2A), // Dark navy
        ),
        scaffoldBackgroundColor: const Color(0xFFF3F7FA), // Soft background
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Color(0xFF125D98), // Deep blue for icons
            size: 24,
          ),
          titleTextStyle: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Color(0xFF125D98), // Matching app title
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF125D98), // Deep blue
          ),
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1C82AD), // Bright teal
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0D1B2A), // Dark navy
          ),
          bodyMedium: TextStyle(
            fontSize: 26,
            color: Color(0xFF0D1B2A), // Consistent with body text
            height: 1.8,
          ),
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shadowColor: const Color(0xFF125D98).withOpacity(0.15), // Subtle shadow
        ),
        dividerTheme: DividerThemeData(
          color: const Color(0xFF125D98).withOpacity(0.1), // Thin divider
          thickness: 1,
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFFF2C335), // Soft golden icons
          size: 24,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF1C82AD), // Bright teal FAB
          foregroundColor: Colors.white, // White icon on FAB
        ),
      ),
      home: SurahListScreen(quranList: quranList),
    );
  }
}
