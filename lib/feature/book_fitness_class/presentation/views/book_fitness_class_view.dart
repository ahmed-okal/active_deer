import 'package:active_deer/core/theme/app_text_theme.dart';
import 'package:active_deer/core/utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../getx/controllers/book_fitness_class_controller.dart';
import 'widgets/custom_calendar.dart';
import 'widgets/exercises_list_view.dart';
import 'widgets/fitness_class_list_view.dart';

class BookFitnessClassView extends GetView<BookFitnessClassController> {
  const BookFitnessClassView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              flexibleSpace: CustomAppBar(title: 'bookFitnessClass'.tr),
            ),
            const CustomCalendar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: AppPadding.horizontalPadding20,
                child: Text(
                  '${'availableExercises'.tr} (12)',
                  style: AppTextTheme.primary700(size: 14),
                ),
              ),
            ),
            const ExercisesListView(),
            const FitnessClassListView(),
          ],
        ),
      ),
    );
  }
}
