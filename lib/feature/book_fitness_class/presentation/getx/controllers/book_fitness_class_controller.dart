import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookFitnessClassController extends GetxController {
  final RxInt currentExercise = 0.obs;
  void changeExercise(int index) {
    currentExercise.value = index;
  }

  // Observable variables
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final Rx<DateTime> focusedDay = DateTime.now().obs;
  final RxBool isLoading = false.obs;

  // Arabic month names
  final List<String> arabicMonths = [
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

  // Arabic day names (starting from Friday as shown in image)
  final List<String> arabicDayNames = [
    'جمعة',
    'سبت',
    'أحد',
    'اثنين',
    'ثلاثاء',
    'أربعاء',
    'خميس',
  ];

  @override
  void onInit() {
    super.onInit();
    // Initialize with current date
    selectedDate.value = DateTime.now();
    focusedDay.value = DateTime.now();
  }

  // Get formatted month and year for header
  String getFormattedMonthYear(DateTime date) {
    if (Get.locale?.languageCode == 'ar') {
      return '${arabicMonths[date.month - 1]} ${date.year}';
    } else {
      return DateFormat('MMMM yyyy', 'en_US').format(date);
    }
  }

  // Get Arabic day name for a specific weekday
  String getArabicDayName(int weekday) {
    // Convert weekday to match our array (Friday = 0)
    // DateTime weekday: Monday = 1, Sunday = 7
    // Our array: Friday = 0, Saturday = 1, Sunday = 2, etc.
    int index;
    switch (weekday) {
      case DateTime.friday:
        index = 0;
        break;
      case DateTime.saturday:
        index = 1;
        break;
      case DateTime.sunday:
        index = 2;
        break;
      case DateTime.monday:
        index = 3;
        break;
      case DateTime.tuesday:
        index = 4;
        break;
      case DateTime.wednesday:
        index = 5;
        break;
      case DateTime.thursday:
        index = 6;
        break;
      default:
        index = 0;
    }
    return arabicDayNames[index];
  }

  // Navigate to previous month
  void previousMonth() {
    focusedDay.value = DateTime(
      focusedDay.value.year,
      focusedDay.value.month - 1,
      1,
    );
  }

  // Navigate to next month
  void nextMonth() {
    focusedDay.value = DateTime(
      focusedDay.value.year,
      focusedDay.value.month + 1,
      1,
    );
  }

  // Select a specific date
  void selectDate(DateTime date) {
    selectedDate.value = date;
    focusedDay.value = date;
  }

  // Check if a date is selected
  bool isDateSelected(DateTime date) {
    return isSameDay(selectedDate.value, date);
  }

  // Check if a date is today
  bool isToday(DateTime date) {
    final now = DateTime.now();
    return isSameDay(now, date);
  }

  // Helper method to check if two dates are the same day
  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  // Get available dates (you can customize this based on your business logic)
  bool isDateAvailable(DateTime date) {
    // For now, all future dates are available
    final now = DateTime.now();
    return date.isAfter(now.subtract(const Duration(days: 1)));
  }

  // Reset to current date
  void resetToToday() {
    final today = DateTime.now();
    selectedDate.value = today;
    focusedDay.value = today;
  }
}
