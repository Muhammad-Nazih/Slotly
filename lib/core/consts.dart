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
  Slot(time: '10:00', meridiem: 'ص', status: SlotStatus.available),
  Slot(time: '10:30', meridiem: 'ص', status: SlotStatus.available),
  Slot(time: '11:00', meridiem: 'ص', status: SlotStatus.available),
  Slot(time: '11:30', meridiem: 'ص', status: SlotStatus.available),
  Slot(time: '12:00', meridiem: 'م', status: SlotStatus.available),
];
