import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new47version/core/colors.dart';
import 'package:new47version/core/consts.dart';

class DateSelector extends StatelessWidget {
  final DateTime? date;
  const DateSelector({super.key, this.date});

  @override
  Widget build(BuildContext context) {
    final String dateText =
        '${arabicDays[date!.weekday - 1]} '
        '${date!.day} '
        '${arabicMonths[date!.month - 1]}';
    return SizedBox(
      height: 74,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dateText,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    fontFamily: arabicFontFamily,
                  ),
                ),
                Gap(4),
                Text(
                  '3 مواعيد متاحة',
                  style: TextStyle(
                    color: Color(0xFF0B3B36),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    fontFamily: arabicFontFamily,
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
