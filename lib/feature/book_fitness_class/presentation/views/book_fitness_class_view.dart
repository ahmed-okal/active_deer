import 'package:active_deer/core/theme/app_text_theme.dart';
import 'package:active_deer/core/utils/app_padding.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/routes/app_pages.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_border.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../getx/controllers/book_fitness_class_controller.dart';
import 'widgets/custom_calendar.dart';

class BookFitnessClassView extends GetView<BookFitnessClassController> {
  const BookFitnessClassView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: CustomScrollView(
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
    );
  }
}

class ExercisesListView extends StatelessWidget {
  const ExercisesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: AppPadding.topPadding20,
        height: AppSize.getHeight(64),
        child: ListView.separated(
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          padding: AppPadding.horizontalPadding20,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: AppSize.getWidth(10));
          },
          itemBuilder: (BuildContext context, int index) {
            return ExerciseItem(index: index);
          },
        ),
      ),
    );
  }
}

class FitnessClassListView extends StatelessWidget {
  const FitnessClassListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: AppPadding.allPadding20,
      sliver: SliverList.separated(
        itemCount: 13,
        itemBuilder: (context, index) {
          return FitnessClassItem(index: index);
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}

class ExerciseItem extends GetView<BookFitnessClassController> {
  const ExerciseItem({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeExercise(index);
      },
      child: Obx(
        () => Container(
          height: AppSize.getHeight(64),
          width: AppSize.getWidth(73),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: controller.currentExercise.value == index
                  ? AppColors.primary
                  : AppColors.secondry,
              width: controller.currentExercise.value == index
                  ? AppSize.getHeight(1.5)
                  : AppSize.getHeight(1),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.only(
                  top: AppSize.getHeight(10),
                  bottom: AppSize.getHeight(2),
                ),
                child: SvgPicture.asset(AppAssets.swim),
              ),
              Text('swimming', style: AppTextTheme.primary700(size: 12)),
            ],
          ),
        ),
      ),
    );
  }
}

class FitnessClassItem extends StatelessWidget {
  const FitnessClassItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.bookExercise,
          arguments: {'heroTag': 'exercise_$index'},
        );
      },
      child: Container(
        height: AppSize.getHeight(72),
        decoration: AppBorder.homeCardBorder,
        child: Row(
          children: [
            Padding(
              padding: AppPadding.horizontalPadding6,
              child: Hero(
                tag: 'exercise_$index',
                child: Container(
                  height: AppSize.getHeight(60),
                  width: AppSize.getWidth(64),
                  decoration: AppBorder.homeCardPrimaryBorder,
                  child: Image.asset(AppAssets.test, fit: BoxFit.cover),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'تمارين الجزء العلوي',
                  style: AppTextTheme.primary700(size: 12),
                ),
                SizedBox(height: AppSize.getHeight(6)),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: AppColors.primary,
                      size: AppSize.getHeight(10),
                    ),
                    SizedBox(width: AppSize.getWidth(4)),
                    Text(
                      'من 08:00 الى 08:45',
                      style: AppTextTheme.primary600(size: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.person,
                      height: AppSize.getHeight(10),
                      width: AppSize.getWidth(10),
                    ),
                    SizedBox(width: AppSize.getWidth(4)),
                    Text(
                      'المدرب : أسامة محمد',
                      style: AppTextTheme.primary600(size: 10),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
