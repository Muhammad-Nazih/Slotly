import 'package:flutter/material.dart';
import 'package:new47version/core/colors.dart';
import 'package:new47version/core/consts.dart';

class DayHeader extends StatelessWidget {
  final DateTime? date;
  const DayHeader({super.key, this.date});

  @override
  Widget build(BuildContext context) {
    final String dateText =
        '${arabicDays[date!.weekday - 1]} '
        '${date!.day} '
        '${arabicMonths[date!.month - 1]}';
    var text = Text(
      dateText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        fontFamily: arabicFontFamily,
      ),
    );
    return Column(
      crossAxisAlignment: .start,
      children: [
        text,
        const Text(
          'الحجز يتوقف قبل الميعاد بـــ 60 دقيقة',
          style: TextStyle(
            color: AppColors.textFaint,
            fontSize: 11,
            fontFamily: arabicFontFamily,
          ),
        ),
      ],
    );
  }
}
