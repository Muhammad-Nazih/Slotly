import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new47version/core/colors.dart';
import 'package:new47version/core/consts.dart';
import 'package:new47version/features/presentation/booking_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const Slotly());
}

class Slotly extends StatelessWidget {
  const Slotly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slotly',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bg,
        fontFamily: arabicFontFamily,
        brightness: Brightness.dark,
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: AppColors.blue,
        ),
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF042F2E),
                  Color(0xFF000000),
                  Color(0xFF0E7490),
                  Color(0xFF000000),
                  Color(0xFF042F2E),
                ],
              ),
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1200),
                child: BookingScreen(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
