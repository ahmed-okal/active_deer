import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_padding.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../getx/controllers/payment_controller.dart';
import '../../getx/controllers/save_card_controller.dart';
import '../saved_cards_view.dart';
import 'credit_card_data_form.dart';
import 'custom_credit_card.dart';
import 'payment_button.dart';
import 'save_card_checkbox.dart';

class PaymentViewBody extends GetView<PaymentController> {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: CustomAppBar(
              title: 'payment'.tr,
              notificationIcon: false,
              // lisIcon: false,
            ),
          ),
          SliverPadding(
            padding: AppPadding.allPadding20,
            sliver: SliverToBoxAdapter(
              child: Column(
                spacing: AppSize.getHeight(20),
                children: [
                  _buildSavedCardsSection(),
                  const CustomCreditCard(),
                  const CreditCardDataForm(),
                  const SaveCardCheckbox(),
                  const PaymentButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSavedCardsSection() {
    // Check if SavedCardsController is available and has saved cards
    try {
      final savedCardsController = Get.find<SavedCardsController>();
      return Obx(() {
        if (savedCardsController.hasActiveCards) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.credit_card, color: AppColors.primary, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'savedCards'.tr,
                        style: AppTextTheme.primary600(size: 14),
                      ),
                      Text(
                        '${savedCardsController.activeCards.length} ${'cardsAvailable'.tr}',
                        style: AppTextTheme.primary400(
                          size: 12,
                        ).copyWith(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () => Get.to(() => const SavedCardsView()),
                  child: Text(
                    'manage'.tr,
                    style: AppTextTheme.primary600(
                      size: 12,
                    ).copyWith(color: AppColors.primary),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      });
    } catch (e) {
      // SavedCardsController not found, return empty widget
      return const SizedBox.shrink();
    }
  }
}
