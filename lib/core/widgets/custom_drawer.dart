// import 'package:active_deer/core/widgets/drawer_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// import '../routes/app_pages.dart';
// import '../services/cash_data_source.dart';
// import '../theme/app_text_theme.dart';
// import '../utils/app_assets.dart';
// import '../utils/size_config.dart';

// class CustomDrawer extends StatelessWidget {
//   const CustomDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           SizedBox(height: AppSize.getHeight(80)),
//           Image.asset(
//             AppAssets.whiteLogo,
//             height: AppSize.getHeight(95),
//             width: AppSize.getWidth(95),
//           ),
//           SizedBox(height: AppSize.getHeight(67)),
//           DrawerItem(
//             icon: AppAssets.home,
//             title: 'home'.tr,
//             onTap: () {
//               Get.toNamed(Routes.home);
//             },
//           ),
//           Divider(height: AppSize.getHeight(15)),
//           DrawerItem(
//             icon: AppAssets.idCard,
//             title: 'idCard'.tr,
//             onTap: () {
//               Get.toNamed(Routes.enterCard);
//             },
//           ),
//           Divider(height: AppSize.getHeight(15)),
//           DrawerItem(
//             icon: AppAssets.mySubscription,
//             title: 'mySubscriptions'.tr,
//             onTap: () {
//               Get.toNamed(Routes.mySubscription);
//             },
//           ),
//           Divider(height: AppSize.getHeight(15)),
//           DrawerItem(
//             icon: AppAssets.time,
//             title: 'fitnessClassSchedule'.tr,
//             onTap: () {
//               Get.toNamed(Routes.fitnessClassSchedule);
//             },
//           ),
//           Divider(height: AppSize.getHeight(15)),
//           DrawerItem(
//             icon: AppAssets.nutritionalAdvice,
//             title: 'nutritionalAdvice'.tr,
//             onTap: () {
//               Get.toNamed(Routes.nutritionalAdvice);
//             },
//           ),
//           Divider(height: AppSize.getHeight(15)),
//           DrawerItem(
//             icon: AppAssets.persent,
//             title: 'offers'.tr,
//             onTap: () {
//               Get.toNamed(Routes.offers);
//             },
//           ),
//           SizedBox(height: AppSize.getHeight(268)),

//           DrawerItem(
//             icon: AppAssets.settings,
//             title: 'settings'.tr,
//             onTap: () {},
//           ),
//           Divider(height: AppSize.getHeight(15)),
//           InkWell(
//             onTap: () {
//               Get.lazyPut(() => Get.find<CashDataSource>().logout());
//               Get.offAllNamed(Routes.auth);
//             },
//             child: Row(
//               children: [
//                 SvgPicture.asset(
//                   AppAssets.logout,
//                   height: AppSize.getHeight(24),
//                   width: AppSize.getWidth(24),
//                 ),
//                 SizedBox(width: AppSize.getWidth(4)),
//                 Text('logout'.tr, style: AppTextTheme.red700(size: 14)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
