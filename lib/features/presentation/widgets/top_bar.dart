import 'package:web/web.dart' as web;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new47version/core/colors.dart';
import 'package:new47version/core/consts.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            if (kIsWeb) {
              // Reload the page on web
              web.window.location.reload();
            }
          },
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.calendar_month_rounded,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
                const Gap(8),
                const Text(
                  'Slotly',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: .center,
            children: [
              Icon(Icons.dashboard_outlined, size: 16, color: AppColors.blue),
              Gap(6),
              Text(
                'لوحة التحكم',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: arabicFontFamily,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
