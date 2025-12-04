import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/payment_controller.dart';

class CustomCreditCard extends GetView<PaymentController> {
  const CustomCreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Directionality(
        textDirection: TextDirection.ltr,
        child: CreditCardWidget(
          padding: 0,
          bankName: "Active Deer",
          enableFloatingCard: true,
          cardType: CardType.mastercard,
          isChipVisible: true,
          cardBgColor: AppColors.primary,
          cardNumber: controller.cardNumber.value,
          expiryDate: controller.expiryDate.value,
          cardHolderName: controller.cardHolderName.value,
          cvvCode: controller.cvvCode.value,
          showBackView: controller.showBackView.value,
          isHolderNameVisible: true,
          onCreditCardWidgetChange: (CreditCardBrand brand) {},
          height: AppSize.getHeight(170),
          width: double.infinity,
          animationDuration: const Duration(milliseconds: 800),
        ),
      ),
    );
  }
}
