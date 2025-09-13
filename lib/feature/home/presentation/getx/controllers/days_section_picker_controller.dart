import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DaysSectionPickerController extends GetxController {
  // Selected date state - initially set to today
  final Rx<DateTime> selectedDate = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize selected date to today
    selectedDate.value = DateTime.now();
  }

  String getArabicDayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'الإثنين';
      case 2:
        return 'الثلاثاء';
      case 3:
        return 'الأربعاء';
      case 4:
        return 'الخميس';
      case 5:
        return 'الجمعة';
      case 6:
        return 'السبت';
      case 7:
        return 'الأحد';
      default:
        return '';
    }
  }

  DateTime get currentDate => DateTime.now();

  int get calendarItemCount {
    final daysInMonth = currentDate.month == 2
        ? (currentDate.year % 4 == 0 ? 29 : 28)
        : [4, 6, 9, 11].contains(currentDate.month)
        ? 30
        : 31;

    // If today is 1st, show only current month days
    return currentDate.day == 1
        ? daysInMonth
        : daysInMonth -
              currentDate.day +
              2; // +2 to include yesterday and today
  }

  DateTime getCalendarDate(int index) {
    if (currentDate.day == 1) {
      // If today is 1st, start from day 1
      return DateTime(currentDate.year, currentDate.month, index + 1);
    } else {
      // Start from yesterday
      final yesterday = currentDate.subtract(Duration(days: 1));
      if (yesterday.month != currentDate.month) {
        // Yesterday was in previous month, start from today
        return DateTime(
          currentDate.year,
          currentDate.month,
          currentDate.day + index,
        );
      } else {
        // Yesterday was in same month
        return DateTime(
          currentDate.year,
          currentDate.month,
          yesterday.day + index,
        );
      }
    }
  }

  bool isToday(DateTime date) {
    return date.day == currentDate.day &&
        date.month == currentDate.month &&
        date.year == currentDate.year;
  }

  bool isSelected(DateTime date) {
    return date.day == selectedDate.value.day &&
        date.month == selectedDate.value.month &&
        date.year == selectedDate.value.year;
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  // Getter for the currently selected date
  DateTime get currentSelectedDate => selectedDate.value;

  // Formatted selected date for display
  String get formattedSelectedDate {
    return DateFormat('dd/MM/yyyy').format(selectedDate.value);
  }

  // Check if selected date is today
  bool get isSelectedDateToday => isToday(selectedDate.value);

  String getDayName(DateTime date) {
    return Get.locale?.languageCode == 'ar'
        ? getArabicDayName(date.weekday)
        : DateFormat('E', Get.locale?.languageCode ?? 'en').format(date);
  }
}
