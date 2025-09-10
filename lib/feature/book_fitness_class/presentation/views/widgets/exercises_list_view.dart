import 'package:flutter/material.dart';

import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import 'exercise_item.dart';

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
