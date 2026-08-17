
import 'package:new47version/features/presentation/widgets/slot_row.dart';

const List<String> arabicDays = [
  'الاثنين',
  'الثلاثاء',
  'الأربعاء',
  'الخميس',
  'الجمعة',
  'السبت',
  'الأحد',
];

const List<String> arabicMonths = [
  'يناير',
  'فبراير',
  'مارس',
  'أبريل',
  'مايو',
  'يونيو',
  'يوليو',
  'أغسطس',
  'سبتمبر',
  'أكتوبر',
  'نوفمبر',
  'ديسمبر',
];

const String arabicFontFamily = 'CairoRegular';


final List<Slot> slots = const [
    Slot('10:00', 'ص', SlotStatus.booked),
    Slot('10:30', 'ص', SlotStatus.booked),
    Slot('11:00', 'ص', SlotStatus.available),
    Slot('11:30', 'ص', SlotStatus.available),
    Slot('12:00', 'م', SlotStatus.available),
  ];