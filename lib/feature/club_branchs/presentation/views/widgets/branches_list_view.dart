import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/club_branchs_controller.dart';
import 'braches_item.dart';

class BranchesListView extends GetView<ClubBranchsController> {
  const BranchesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsetsDirectional.only(
        start: AppSize.getWidth(20),
        end: AppSize.getWidth(20),
        top: AppSize.getHeight(10),
        bottom: AppSize.getHeight(20),
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const BranchesItem();
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: AppSize.getHeight(10));
      },
      itemCount: 8,
    );
  }
}
