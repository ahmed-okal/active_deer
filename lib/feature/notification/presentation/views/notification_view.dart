import 'package:active_deer/core/utils/app_border.dart';
import 'package:active_deer/core/utils/app_padding.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:active_deer/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/app_assets.dart';
import '../getx/controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const CustomDrawer(),
      body: SafeArea(
        top: false,

        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              flexibleSpace: CustomAppBar(
                title: 'notifications'.tr,
                notificationIcon: false,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                child: ListView.separated(
                  padding: AppPadding.allPadding20,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: AppSize.getHeight(10));
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: AppSize.getHeight(69),
                      decoration: AppBorder.homeCardBorder,
                      child: Row(
                        children: [
                          Padding(
                            padding: AppPadding.horizontalPadding10,
                            child: SvgPicture.asset(
                              AppAssets.notificationSuccess,
                              height: AppSize.getHeight(34.5),
                            ),
                          ),
                          SizedBox(
                            width: AppSize.getWidth(260),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: AppSize.getHeight(4),
                              children: [
                                Text(
                                  'عرض اليوم الوطني',
                                  style: AppTextTheme.primary700(size: 14),
                                ),
                                Text(
                                  'تم تجديد اشتراكك بنجاح في عرض اليوم الوطني',
                                  style: AppTextTheme.secondary700(size: 12),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: EdgeInsetsDirectional.only(
                              end: AppSize.getWidth(10),
                              top: AppSize.getHeight(10),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: Text(
                                'الان',
                                style: AppTextTheme.secondary700(size: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
