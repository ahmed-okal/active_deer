import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../getx/controllers/save_card_controller.dart';
import 'widgets/saved_card_item.dart';

class SavedCardsView extends GetView<SavedCardsController> {
  const SavedCardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              flexibleSpace: CustomAppBar(
                title: 'savedCards'.tr,
                // showBackButton: true,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: AppPadding.horizontalPadding20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSize.getHeight(20)),

                    // Page description
                    Text(
                      'manageYourSavedCards'.tr,
                      style: AppTextTheme.primary400(
                        size: 14,
                      ).copyWith(color: Colors.grey.shade600),
                    ),

                    SizedBox(height: AppSize.getHeight(24)),

                    // Saved cards content
                    Obx(() => _buildContent()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (controller.isLoading.value) {
      return const Center(child: LoadingWidget());
    }

    if (!controller.hasActiveCards) {
      return _buildEmptyState();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Active cards section
        if (controller.hasActiveCards) ...[
          Text('activeCards'.tr, style: AppTextTheme.primary700(size: 16)),
          SizedBox(height: AppSize.getHeight(16)),

          ...controller.activeCards.map(
            (card) => SavedCardItem(
              card: card,
              isSelected: false, // No selection needed in this view
              onTap: () {}, // No tap action needed
              onDelete: () => _showDeleteConfirmation(card.token),
            ),
          ),
        ],

        // Expired cards section
        if (controller.expiredCards.isNotEmpty) ...[
          SizedBox(height: AppSize.getHeight(32)),
          Text('expiredCards'.tr, style: AppTextTheme.primary700(size: 16)),
          SizedBox(height: AppSize.getHeight(16)),

          ...controller.expiredCards.map(
            (card) => SavedCardItem(
              card: card,
              isSelected: false,
              onTap: () {},
              onDelete: () => _showDeleteConfirmation(card.token),
            ),
          ),
        ],

        SizedBox(height: AppSize.getHeight(32)),

        // Refresh button
        Center(
          child: TextButton.icon(
            onPressed: controller.refreshCards,
            icon: Icon(
              Icons.refresh,
              color: AppColors.primary,
              size: AppSize.getWidth(20),
            ),
            label: Text(
              'refreshCards'.tr,
              style: AppTextTheme.primary600(
                size: 14,
              ).copyWith(color: AppColors.primary),
            ),
          ),
        ),

        SizedBox(height: AppSize.getHeight(40)),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSize.getWidth(40)),
      child: Column(
        children: [
          SizedBox(height: AppSize.getHeight(60)),

          Icon(
            Icons.credit_card_off,
            size: AppSize.getWidth(80),
            color: Colors.grey.shade300,
          ),

          SizedBox(height: AppSize.getHeight(24)),

          Text(
            'noSavedCards'.tr,
            style: AppTextTheme.primary700(
              size: 18,
            ).copyWith(color: Colors.grey.shade600),
          ),

          SizedBox(height: AppSize.getHeight(12)),

          Text(
            'saveCardForFasterCheckout'.tr,
            style: AppTextTheme.primary400(
              size: 14,
            ).copyWith(color: Colors.grey.shade500),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: AppSize.getHeight(32)),

          ElevatedButton.icon(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.add_card),
            label: Text('addNewCard'.tr),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.getWidth(24),
                vertical: AppSize.getHeight(12),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          SizedBox(height: AppSize.getHeight(60)),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(String token) {
    Get.dialog(
      AlertDialog(
        title: Text('deleteCard'.tr),
        content: Text('deleteCardConfirmation'.tr),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('cancel'.tr)),
          TextButton(
            onPressed: () {
              Get.back();
              // controller.deleteCard(token);
            },
            child: Text('delete'.tr, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
