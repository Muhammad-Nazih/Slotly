import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new47version/core/consts.dart';

class SectionLabel extends StatelessWidget {
  const SectionLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_today_outlined, size: 16, color: Colors.white70),
        Gap(8),
        Text(
          'اختار اليوم',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: arabicFontFamily,
          ),
        ),
      ],
    );
  }
}
