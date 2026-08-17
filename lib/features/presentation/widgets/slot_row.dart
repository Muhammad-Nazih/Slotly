import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new47version/core/colors.dart';
import 'package:new47version/core/consts.dart';
import 'package:new47version/features/presentation/widgets/bottom_sheet_content.dart';

enum SlotStatus { booked, available }

class Slot {
  final String time;
  final String meridiem;
  final SlotStatus status;
  const Slot(this.time, this.meridiem, this.status);
}

class SlotRow extends StatefulWidget {
  final Slot slot;
  const SlotRow({super.key, required this.slot});

  @override
  State<SlotRow> createState() => _SlotRowState();
}

class _SlotRowState extends State<SlotRow> {
  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'من فضلك اكتب الاسم بالكامل';
    }
    if (value.trim().length < 2) {
      return 'الاسم لازم يكون حرفين على الأقل';
    }
    return null;
  }

  String? validateEgyptianPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'من فضلك اكتب رقم الموبايل';
    }

    final cleanedNumber = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (cleanedNumber.length != 11) {
      return 'الرقم لازم يكون 11 رقم بالظبط';
    }

    if (!RegExp(r'^(010|011|012|015)').hasMatch(cleanedNumber)) {
      return 'الرقم لازم يبدأ بـ 010 أو 011 أو 012 أو 015';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final booked = widget.slot.status == SlotStatus.booked;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.access_time_rounded,
                size: 15,
                color: Color.fromARGB(167, 33, 149, 243),
              ),
              const Gap(6),
              Text(
                '${widget.slot.time} ${widget.slot.meridiem}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: arabicFontFamily,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              if (!booked) {
                showModalBottomSheet(
                  context: context,
                  isDismissible: true,
                  enableDrag: true,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  builder: (context) {
                    return BottomSheetContent(
                      validateName: validateName,
                      validateEgyptianPhone: validateEgyptianPhone,
                    );
                  },
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: booked ? AppColors.grey : AppColors.blueeeeeeeeeeeee,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (booked) ...[
                    const Icon(
                      Icons.lock_outline,
                      size: 13,
                      color: AppColors.textGrey,
                    ),
                    const Gap(5),
                  ],
                  Text(
                    booked ? 'محجوز' : 'احجز',
                    style: TextStyle(
                      color: booked ? AppColors.textGrey : Colors.black,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      fontFamily: arabicFontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
