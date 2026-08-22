import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new47version/core/colors.dart';
import 'package:new47version/core/consts.dart';
import 'package:new47version/features/presentation/widgets/date_selector.dart';
import 'package:new47version/features/presentation/widgets/day_header.dart';
import 'package:new47version/features/presentation/widgets/hero_card.dart';
import 'package:new47version/features/presentation/widgets/section_label.dart';
import 'package:new47version/features/presentation/widgets/slot_row.dart';
import 'package:new47version/features/presentation/widgets/top_bar.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF042F2E), Color(0xFF000000), Color(0xFF0E7490)],
          ),
        ),
        child: SafeArea(child: _buildContent()),
      ),
    );
  }

  ListView _buildContent() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 24),
      children: [
        TopBar(),
        const Gap(22),
        HeroCard(onPressed: selectDate),
        const Gap(26),
        SectionLabel(),
        const Gap(14),
        DateSelector(date: selectedDate),
        const Gap(26),
        DayHeader(date: selectedDate),
        const Gap(14),
        ...slots.map(
          (s) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: SlotRow(slot: s, date: selectedDate),
          ),
        ),
      ],
    );
  }

  Future<void> selectDate() async {
    final DateTime now = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: now,
      lastDate: DateTime(now.year, now.month + 1, now.day),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: AppColors.blue,
              onPrimary: Colors.black,
              surface: AppColors.card,
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}
