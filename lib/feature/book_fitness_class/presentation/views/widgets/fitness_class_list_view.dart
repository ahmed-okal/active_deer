import 'package:flutter/material.dart';

import '../../../../../core/utils/app_padding.dart';
import 'fitness_class_item.dart';

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
