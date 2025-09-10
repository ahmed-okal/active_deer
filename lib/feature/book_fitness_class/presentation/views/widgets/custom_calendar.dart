import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/book_fitness_class_controller.dart';

class CustomCalendar extends GetView<BookFitnessClassController> {
  const CustomCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: AppPadding.allPadding20,
        decoration: _containerDecoration(),
        child: Padding(
          padding: AppPadding.allPadding25,
          child: Obx(() => _buildTableCalendar()),
        ),
      ),
    );
  }

  /// ================== Main TableCalendar ==================
  Widget _buildTableCalendar() {
    return TableCalendar<dynamic>(
      locale: Get.locale?.languageCode == 'ar' ? 'ar_EG' : 'en_US',
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: controller.focusedDay.value,
      calendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.friday,

      headerStyle: _headerStyle(),
      daysOfWeekStyle: _daysOfWeekStyle(),
      calendarStyle: _calendarStyle(),

      rowHeight: AppSize.getHeight(40),
      daysOfWeekHeight: AppSize.getHeight(35),

      selectedDayPredicate: controller.isDateSelected,
      onDaySelected: (selectedDay, focusedDay) =>
          controller.selectDate(selectedDay),
      onPageChanged: (focusedDay) => controller.focusedDay.value = focusedDay,

      calendarBuilders: _calendarBuilders(),
    );
  }

  /// ================== Decorations ==================
  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      color: AppColors.background,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(width: 1, color: AppColors.darkGrey),
      boxShadow: [
        BoxShadow(
          color: AppColors.primary.withValues(alpha: 0.05),
          blurRadius: 10,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  /// ================== Header ==================
  HeaderStyle _headerStyle() {
    return HeaderStyle(
      formatButtonVisible: false,
      titleCentered: true,
      leftChevronIcon: Icon(
        Icons.chevron_left,
        color: AppColors.primary,
        size: AppSize.getHeight(24),
      ),
      rightChevronIcon: Icon(
        Icons.chevron_right,
        color: AppColors.primary,
        size: AppSize.getHeight(24),
      ),
      headerPadding: EdgeInsets.zero,
      titleTextFormatter: (date, locale) =>
          controller.getFormattedMonthYear(date),
      titleTextStyle: AppTextTheme.primary700(size: 18),
    );
  }

  /// ================== Days of Week ==================
  DaysOfWeekStyle _daysOfWeekStyle() {
    return DaysOfWeekStyle(
      weekdayStyle: AppTextTheme.primary700(size: 14),
      weekendStyle: AppTextTheme.primary700(size: 14),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.grey, width: 1)),
      ),
      dowTextFormatter: (date, locale) {
        if (Get.locale?.languageCode == 'ar') {
          return controller.getArabicDayName(date.weekday);
        }
        return ['Fri', 'Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu'][date.weekday %
            7];
      },
    );
  }

  /// ================== Calendar Styling ==================
  CalendarStyle _calendarStyle() {
    return CalendarStyle(
      cellMargin: EdgeInsets.all(AppSize.getWidth(2)),
      cellPadding: EdgeInsets.zero,
      defaultTextStyle: AppTextTheme.primary700(size: 14),
      weekendTextStyle: AppTextTheme.primary700(size: 14),
      outsideTextStyle: AppTextTheme.primary400(size: 14),
      disabledTextStyle: AppTextTheme.primary300(size: 14),
      rangeEndTextStyle: AppTextTheme.primary700(size: 14),
      rangeStartTextStyle: AppTextTheme.primary700(size: 14),
      todayDecoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
      ),
      todayTextStyle: AppTextTheme.white700(size: 14),
      selectedDecoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.8),
        shape: BoxShape.circle,
      ),
      selectedTextStyle: AppTextTheme.white700(size: 14),
      withinRangeTextStyle: AppTextTheme.primary700(size: 14),
      markerSize: 0,
      markersMaxCount: 0,
      rowDecoration: const BoxDecoration(),
      tableBorder: const TableBorder(),
    );
  }

  /// ================== Calendar Builders ==================
  CalendarBuilders<dynamic> _calendarBuilders() {
    return CalendarBuilders(
      defaultBuilder: (context, day, focusedDay) =>
          _dayContainer(day, AppTextTheme.primary700(size: 14)),
      todayBuilder: (context, day, focusedDay) => Container(
        margin: EdgeInsets.symmetric(vertical: AppSize.getWidth(6)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.secondry, width: 1),
        ),
        child: Text('${day.day}', style: AppTextTheme.primary700(size: 14)),
      ),
      selectedBuilder: (context, day, focusedDay) => Container(
        margin: EdgeInsets.symmetric(
          vertical: AppSize.getWidth(6),
          horizontal: AppSize.getWidth(2),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text('${day.day}', style: AppTextTheme.white700(size: 14)),
      ),
      outsideBuilder: (context, day, focusedDay) => _dayContainer(
        day,
        AppTextTheme.secondary600(size: 14),
        margin: EdgeInsets.all(AppSize.getWidth(2)),
      ),
    );
  }

  Widget _dayContainer(DateTime day, TextStyle style, {EdgeInsets? margin}) {
    return Container(
      margin:
          margin ??
          EdgeInsets.symmetric(
            vertical: AppSize.getWidth(6),
            horizontal: AppSize.getWidth(2),
          ),
      alignment: Alignment.center,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Text('${day.day}', style: style),
    );
  }
}
