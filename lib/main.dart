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
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: BookingScreen(),
      ),
    );
  }
}
