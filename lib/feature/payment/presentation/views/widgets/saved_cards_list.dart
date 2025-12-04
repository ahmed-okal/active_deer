// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../../../core/theme/app_text_theme.dart';
// import '../../../../../core/utils/app_colors.dart';
// import '../../../../../core/utils/size_config.dart';
// import '../../../../../core/widgets/loading_widget.dart';
// import '../../getx/controllers/saved_cards_controller.dart';
// import 'saved_card_item.dart';

// class SavedCardsList extends GetView<SavedCardsController> {
//   const SavedCardsList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (controller.isLoading.value) {
//         return const Center(child: LoadingWidget());
//       }

//       if (!controller.hasActiveCards) {
//         return _buildEmptyState();
//       }

//       return Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('savedCards'.tr, style: AppTextTheme.primary700(size: 16)),
//           SizedBox(height: AppSize.getHeight(16)),

//           ...controller.activeCards.map(
//             (card) => SavedCardItem(
//               card: card,
//               isSelected: controller.isCardSelected(card.token),
//               onTap: () => controller.selectCard(card.token),
//               onDelete: () => _showDeleteConfirmation(card.token),
//             ),
//           ),

//           SizedBox(height: AppSize.getHeight(16)),
//         ],
//       );
//     });
//   }

//   Widget _buildEmptyState() {
//     return Container(
//       padding: EdgeInsets.all(AppSize.getWidth(20)),
//       child: Column(
//         children: [
//           Icon(
//             Icons.credit_card_off,
//             size: AppSize.getWidth(48),
//             color: Colors.grey.shade400,
//           ),
//           SizedBox(height: AppSize.getHeight(16)),
//           Text(
//             'noSavedCards'.tr,
//             style: AppTextTheme.primary600(
//               size: 16,
//             ).copyWith(color: Colors.grey.shade600),
//           ),
//           SizedBox(height: AppSize.getHeight(8)),
//           Text(
//             'saveCardForFasterCheckout'.tr,
//             style: AppTextTheme.primary400(
//               size: 14,
//             ).copyWith(color: Colors.grey.shade500),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

//   void _showDeleteConfirmation(String token) {
//     Get.dialog(
//       AlertDialog(
//         title: Text('deleteCard'.tr),
//         content: Text('deleteCardConfirmation'.tr),
//         actions: [
//           TextButton(onPressed: () => Get.back(), child: Text('cancel'.tr)),
//           TextButton(
//             onPressed: () {
//               Get.back();
//               controller.deleteCard(token);
//             },
//             child: Text(
//               'delete'.tr,
//               style: const TextStyle(color: AppColors.red),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
