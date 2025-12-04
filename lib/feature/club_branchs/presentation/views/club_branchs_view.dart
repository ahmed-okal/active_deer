import 'package:active_deer/core/utils/app_padding.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../getx/controllers/club_branchs_controller.dart';
import 'widgets/branches_list_view.dart';
import 'widgets/branches_location_tap_bar.dart';

class ClubBranchsView extends GetView<ClubBranchsController> {
  const ClubBranchsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,

            flexibleSpace: CustomAppBar(
              title: 'ourBranches'.tr,
              notificationIcon: false,
            ),
          ),
          SliverPadding(
            padding: AppPadding.topPadding20,
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BranchesLocationTapBar(),
                  SizedBox(height: AppSize.getHeight(10)),
                  Padding(
                    padding: AppPadding.horizontalPadding20,
                    child: Text(
                      'clubBranches'.tr,
                      style: AppTextTheme.primary700(size: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: const BranchesListView()),
        ],
      ),
    );
  }
}
