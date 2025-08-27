import 'package:active_deer/core/theme/app_text_theme.dart';
import 'package:active_deer/core/utils/app_assets.dart';
import 'package:active_deer/core/utils/app_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/size_config.dart';
import '../getx/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: SafeArea(
                child: Padding(
                  padding: AppPadding.startPadding25,
                  child: Row(
                    spacing: AppSize.getWidth(12),
                    children: [
                      SvgPicture.asset(
                        AppAssets.menuIcon,
                        height: AppSize.getHeight(18),
                        width: AppSize.getWidth(18),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${'hi'.tr} ${'ahmed'}',
                            style: AppTextTheme.white900(size: 12),
                          ),
                          Text(
                            'timeToChallenge'.tr,
                            style: AppTextTheme.white400(size: 12),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: AppPadding.endPadding20,
                        child: SvgPicture.asset(
                          AppAssets.notification,
                          height: AppSize.getHeight(18),
                          width: AppSize.getWidth(18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: AppPadding.verticalPadding20,
                child: Image.asset(
                  AppAssets.logo,
                  height: AppSize.getHeight(98),
                  width: AppSize.getWidth(98),
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppSize.getHeight(3),
                    children: [
                      Container(
                        height: AppSize.getHeight(2),
                        width: AppSize.getWidth(14),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(6),
                            bottomEnd: Radius.circular(6),
                          ),
                        ),
                      ),
                      Container(
                        height: AppSize.getHeight(2),
                        width: AppSize.getWidth(11),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(6),
                            bottomEnd: Radius.circular(6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: AppPadding.horizontalPadding6,
                      child: Container(
                        height: AppSize.getHeight(83),
                        decoration: AppBorder.homeContainerBorder,
                        child: Container(
                          margin: EdgeInsets.all(AppSize.getHeight(1)),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: AppPadding.homeCardPadding,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.premiumIcon,
                                      height: AppSize.getHeight(19),
                                      width: AppSize.getWidth(19),
                                    ),
                                    Text(
                                      'premiumSubscription'.tr,
                                      style: AppTextTheme.primary800(size: 14),
                                    ),
                                    Spacer(),
                                    Align(
                                      alignment: AlignmentDirectional.topEnd,
                                      child: PopupMenuButton<String>(
                                        padding: EdgeInsets.zero,
                                        menuPadding: EdgeInsets.zero,
                                        constraints: BoxConstraints(
                                          maxWidth: AppSize.getWidth(150),
                                          maxHeight: AppSize.getHeight(58),
                                        ),
                                        itemBuilder: (context) => [
                                          PopupMenuItem<String>(
                                            height: AppSize.getHeight(29),
                                            onTap: () {},
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.block,
                                                  size: AppSize.getHeight(12),
                                                ),
                                                SizedBox(
                                                  width: AppSize.getWidth(4),
                                                ),
                                                Text(
                                                  'stop'.tr,
                                                  style:
                                                      AppTextTheme.primary700(
                                                        size: 10,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const PopupMenuDivider(
                                            height: 1,
                                            thickness: 1,
                                          ),
                                          PopupMenuItem<String>(
                                            height: AppSize.getHeight(29),

                                            onTap: () {},
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  AppAssets.waiver,
                                                  height: AppSize.getHeight(12),
                                                  width: AppSize.getWidth(12),
                                                ),
                                                SizedBox(
                                                  width: AppSize.getWidth(4),
                                                ),
                                                Text(
                                                  'waiver'.tr,
                                                  style:
                                                      AppTextTheme.primary700(
                                                        size: 10,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                        child: Icon(
                                          Icons.more_vert,
                                          color: AppColors.primary,
                                          size: AppSize.getHeight(14),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: AppSize.getHeight(10)),
                                Center(
                                  child: LinearPercentIndicator(
                                    padding: EdgeInsets.zero,
                                    isRTL: Locale('ar', 'EG') == Get.locale
                                        ? true
                                        : false,
                                    barRadius: const Radius.circular(10),
                                    animation: true,
                                    animationDuration: 1000,
                                    lineHeight: 8.0,
                                    percent: 0.5,
                                    progressColor: AppColors.primary,
                                    backgroundColor: AppColors.grey,
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time_rounded,
                                      color: AppColors.primary,
                                      size: AppSize.getHeight(11),
                                    ),
                                    SizedBox(width: AppSize.getWidth(2)),
                                    Text(
                                      '${'startDate'.tr}: 29/4/2025',
                                      style: AppTextTheme.secondary700(
                                        size: 10,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.access_time_rounded,
                                      color: AppColors.primary,
                                      size: AppSize.getHeight(11),
                                    ),
                                    SizedBox(width: AppSize.getWidth(2)),
                                    Text(
                                      '${'endDate'.tr}: 29/4/2025',
                                      style: AppTextTheme.secondary700(
                                        size: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: AppSize.getHeight(3),
                    children: [
                      Container(
                        height: AppSize.getHeight(2),
                        width: AppSize.getWidth(11),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(6),
                            bottomStart: Radius.circular(6),
                          ),
                        ),
                      ),
                      Container(
                        height: AppSize.getHeight(2),
                        width: AppSize.getWidth(14),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(6),
                            bottomEnd: Radius.circular(6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: AppSize.getHeight(13)),
              Padding(
                padding: AppPadding.horizontalPadding20,
                child: Row(
                  children: [
                    Container(
                      height: AppSize.getHeight(146),
                      width: AppSize.getWidth(154),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppAssets.test),
                          fit: BoxFit.cover,
                        ),

                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'bookFitnessClass'.tr,
                            style: AppTextTheme.white800(size: 14),
                          ),
                          Text(
                            'startYourJourney'.tr,
                            style: AppTextTheme.white600(size: 8),
                          ),
                          SizedBox(height: AppSize.getHeight(13)),
                        ],
                      ),
                    ),
                    Spacer(),
                    Column(
                      spacing: AppSize.getHeight(8),
                      children: [
                        HomeActionsCard(
                          onTap: () {},
                          title: 'mySubscriptions'.tr,
                          icon: Icon(
                            Icons.access_time_rounded,
                            color: AppColors.white,
                            size: AppSize.getHeight(16),
                          ),
                        ),
                        HomeActionsCard(
                          onTap: () {},
                          title: 'offers'.tr,
                          icon: SvgPicture.asset(
                            AppAssets.persent,
                            height: AppSize.getHeight(16),
                            width: AppSize.getWidth(16),
                          ),
                        ),
                        HomeActionsCard(
                          onTap: () {},
                          title: 'idCard'.tr,
                          icon: SvgPicture.asset(
                            AppAssets.card,
                            height: AppSize.getHeight(16),
                            width: AppSize.getWidth(16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.getHeight(15)),
              Padding(
                padding: AppPadding.horizontalPadding20,
                child: Row(
                  children: [
                    Text(
                      'fitnessClassesschedule'.tr,
                      style: AppTextTheme.primary700(size: 12),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'more'.tr,
                        style: AppTextTheme.secondary700(size: 12).copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.darkGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.getHeight(15)),
            ]),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: AppSize.getHeight(73),
              child: ListView.separated(
                padding: AppPadding.horizontalPadding20,
                separatorBuilder: (context, index) =>
                    SizedBox(width: AppSize.getWidth(10)),
                itemCount: 30,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final dayDate = controller.getCalendarDate(index);
                  final isToday = controller.isToday(dayDate);
                  final dayName = controller.getDayName(dayDate);

                  return Container(
                    height: AppSize.getHeight(73),
                    width: AppSize.getWidth(56),
                    decoration: isToday
                        ? AppBorder.homeCardPrimaryBorder
                        : AppBorder.homeCardBorder,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSize.getHeight(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            dayName,
                            style: AppTextTheme.primary400(size: 12),
                          ),
                          Text(
                            '${dayDate.day}',
                            style: AppTextTheme.primary800(size: 14),
                          ),
                          Container(
                            height: AppSize.getHeight(8),
                            width: AppSize.getWidth(8),
                            decoration: BoxDecoration(
                              color: isToday
                                  ? AppColors.green
                                  : AppColors.darkGrey,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverPadding(
            padding: AppPadding.allPadding20,
            sliver: SliverList.separated(
              itemCount: 3,

              itemBuilder: (context, index) {
                return Container(
                  height: AppSize.getHeight(72),
                  decoration: AppBorder.homeCardBorder,
                  child: Row(
                    children: [
                      Padding(
                        padding: AppPadding.horizontalPadding6,
                        child: Container(
                          height: AppSize.getHeight(60),
                          width: AppSize.getWidth(64),
                          decoration: AppBorder.homeCardPrimaryBorder,
                          child: Image.asset(AppAssets.test, fit: BoxFit.cover),
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
                                '20 دقيقة',
                                style: AppTextTheme.primary600(size: 10),
                              ),
                              SizedBox(width: AppSize.getWidth(6)),
                              SvgPicture.asset(
                                AppAssets.star,
                                height: AppSize.getHeight(10),
                                width: AppSize.getWidth(10),
                              ),
                              SizedBox(width: AppSize.getWidth(4)),
                              Text(
                                'مبتدئين',
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
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                  SizedBox(height: AppSize.getHeight(17)),
                  Padding(
                    padding: AppPadding.horizontalPadding20,
                    child: Container(
                      height: AppSize.getHeight(110),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(AppAssets.test),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.getHeight(17)),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class HomeActionsCard extends StatelessWidget {
  const HomeActionsCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });
  final VoidCallback onTap;
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.zero,
        height: AppSize.getHeight(42.67),
        width: AppSize.getWidth(185),
        decoration: AppBorder.homeCardBorder,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.getWidth(12),
                vertical: AppSize.getHeight(8),
              ),
              child: Container(
                width: AppSize.getHeight(26),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(child: icon),
              ),
            ),
            Text(title, style: AppTextTheme.primary700(size: 14)),
          ],
        ),
      ),
    );
  }
}
