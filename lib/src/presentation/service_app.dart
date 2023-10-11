import 'package:flutter/material.dart';
import 'package:sensors_monitoring/src/presentation/pages/home_page.dart';

class ServiceApp extends StatelessWidget {
  const ServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          surface: Color(0xFFFFFFFF),
          primary: Color(0xFF0085FF),
          secondary: Color(0xFF000000),
          tertiary: Color(0xFF777777),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          ),
          bodyLarge: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          bodySmall: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            height: -0.2,
          ),
          headlineLarge: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            height: -0.2,
          ),
          headlineSmall: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
            height: -0.4,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
