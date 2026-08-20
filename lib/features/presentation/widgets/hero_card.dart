import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new47version/core/colors.dart';
import 'package:new47version/core/consts.dart';

class HeroCard extends StatelessWidget {
  final VoidCallback onPressed;
  const HeroCard({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.sizeOf(context).height * 0.33,
      ),
      // height: MediaQuery.sizeOf(context).height * 0.33,
      padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF0E7490), Color(0xFF042F2E), Color(0xFF000000)],
        ),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        children: [
          const Text(
            'احجز ميعادك',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
              fontFamily: arabicFontFamily,
            ),
          ),
          const Gap(10),
          const Text(
            'اختار اليوم اللي يناسبك من المواعيد المتاحة واحجز في ثانية – من غير تسجيل',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textGrey,
              fontSize: 16,
              height: 1.6,
              fontFamily: arabicFontFamily,
            ),
          ),
          const Gap(22),
          GestureDetector(
            onTap: onPressed,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 13,
                ),
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'شوف المواعيد',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                        fontFamily: arabicFontFamily,
                      ),
                    ),
                    Gap(6),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.black,
                      size: 24,
                      fontWeight: .bold,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
