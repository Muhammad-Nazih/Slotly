import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new47version/core/colors.dart';
import 'package:new47version/core/consts.dart';
import 'package:new47version/features/presentation/widgets/custom_button.dart';
import 'package:new47version/features/presentation/widgets/slot_row.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({
    super.key,
    required this.validateName,
    required this.validateEgyptianPhone,
    required this.date,
    required this.slot,
  });
  final DateTime date;
  final Slot slot;
  final String? Function(String?)? validateName;
  final String? Function(String?)? validateEgyptianPhone;

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  bool _isBooking = false;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String dateText =
        '${arabicDays[widget.date.weekday - 1]} '
        '${widget.date.day} '
        '${arabicMonths[widget.date.month - 1]}';
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withValues(alpha: 0.08),
                  Colors.black.withValues(alpha: 0.35),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                12,
                20,
                24 + MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 42,
                          height: 4,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.35),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      Text(
                        'تأكيد الحجز',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          fontFamily: arabicFontFamily,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            dateText,
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 17,
                              fontFamily: arabicFontFamily,
                            ),
                          ),
                          const Gap(8),
                          Text(
                            '-  ${widget.slot.time} ${widget.slot.meridiem}',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 17,
                              fontFamily: arabicFontFamily,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Text(
                        'الاسم',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 17,
                          fontFamily: arabicFontFamily,
                        ),
                      ),
                      const Gap(5),
                      TextFormField(
                        controller: _nameController,
                        enabled: !_isBooking,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: arabicFontFamily,
                          letterSpacing: 1.2,
                          height: 1.5,
                        ),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF2C2C2E),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade700),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade700),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorStyle: TextStyle(
                            fontFamily: arabicFontFamily,
                            fontSize: 11,
                          ),
                          prefixIcon: const Icon(Icons.person_outlined),
                          hintText: 'اسمك بالكامل',
                          hintStyle: TextStyle(
                            height: 2,
                            color: Colors.grey.shade600,
                            fontFamily: arabicFontFamily,
                          ),
                        ),
                        validator: widget.validateName,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const Gap(15),
                      Text(
                        'رقم الموبايل',
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 17,
                          fontFamily: arabicFontFamily,
                        ),
                      ),
                      const Gap(5),
                      TextFormField(
                        controller: _phoneController,
                        enabled: !_isBooking,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: arabicFontFamily,
                          letterSpacing: 1.2,
                          height: 1.5,
                        ),
                        cursorColor: Colors.grey,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF2C2C2E),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade700),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade700),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorStyle: TextStyle(
                            fontFamily: arabicFontFamily,
                            fontSize: 11,
                          ),
                          prefixIcon: const Icon(Icons.phone),
                          hintText: '01xxxxxxxxx',
                          hintStyle: TextStyle(
                            height: 2,
                            color: Colors.grey.shade600,
                            fontFamily: arabicFontFamily,
                          ),
                        ),
                        validator: widget.validateEgyptianPhone,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CustomButton(
                              onTap: _isBooking
                                  ? null
                                  : () async {
                                      final isValid =
                                          _formKey.currentState?.validate() ??
                                          false;
                                      if (!isValid) return;

                                      // نقفل الكيبورد فورًا عشان
                                      // إعادة حساب المساحة تحصل
                                      // قبل ما نبدأ حالة التحميل،
                                      // مش أثناءها.
                                      FocusScope.of(context).unfocus();

                                      setState(() {
                                        _isBooking = true;
                                      });

                                      await Future.delayed(
                                        const Duration(seconds: 2),
                                      );

                                      if (!context.mounted) {
                                        return;
                                      }

                                      Navigator.pop(context);

                                      _isBooking = false;

                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor: AppColors.card,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                            ),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.all(
                                                    14,
                                                  ),
                                                  decoration:
                                                      const BoxDecoration(
                                                        color: AppColors.green,
                                                        shape: BoxShape.circle,
                                                      ),
                                                  child: const Icon(
                                                    Icons.check_rounded,
                                                    color: Colors.black,
                                                    size: 40,
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                const Text(
                                                  'تم الحجز بنجاح',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        arabicFontFamily,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                const Text(
                                                  'تم تأكيد حجز الموعد بنجاح',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: AppColors.textGrey,
                                                    fontSize: 13,
                                                    fontFamily:
                                                        arabicFontFamily,
                                                  ),
                                                ),
                                                const SizedBox(height: 24),
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          AppColors.blue,
                                                      foregroundColor:
                                                          Colors.black,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12,
                                                            ),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            vertical: 12,
                                                          ),
                                                    ),
                                                    child: const Text(
                                                      'تمام',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            arabicFontFamily,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                              backgroundColor: AppColors.blueeeeeeeeeeeee,
                              icon: Icons.check,
                              iconColor: Colors.black,
                              borderColor: Colors.white38,
                              label: _isBooking ? 'جارِ الحجز...' : 'تأكيد',
                              textColor: Colors.black,
                              fontWeight: .w900,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 1,
                            child: CustomButton(
                              onTap: _isBooking
                                  ? null
                                  : () => Navigator.pop(context),
                              backgroundColor: const Color(0xFF2C2C2E),
                              borderColor: Colors.grey.shade700,
                              label: 'إلغاء',
                              fontSize: 20,
                              fontWeight: .w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
