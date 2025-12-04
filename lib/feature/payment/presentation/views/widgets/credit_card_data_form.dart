import 'package:active_deer/core/utils/app_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../getx/controllers/payment_controller.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class CreditCardDataForm extends GetView<PaymentController> {
  const CreditCardDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('cardDetails'.tr, style: AppTextTheme.primary700(size: 18)),
          SizedBox(height: AppSize.getHeight(20)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                'cardHolderName'.tr,
                style: AppTextTheme.primary700(size: 14),
              ),
              SizedBox(height: AppSize.getHeight(3)),
              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomTextFormField(
                  controller: controller.cardHolderController,
                  focusNode: controller.cardHolderFocus,
                  hintText: 'JOHN DOE',
                  keyboardType: TextInputType.text,
                  validator: AppValidation.cardHolderName,
                  onChanged: controller.updateCardHolderName,
                  inputFormatters: [UpperCaseTextFormatter()],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.getHeight(16)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text('cardNumber'.tr, style: AppTextTheme.primary700(size: 14)),
              SizedBox(height: AppSize.getHeight(3)),
              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomTextFormField(
                  controller: controller.cardNumberController,
                  focusNode: controller.cardNumberFocus,
                  hintText: '1234 5678 9012 3456',
                  keyboardType: TextInputType.number,
                  validator: AppValidation.cardNumber,
                  onChanged: controller.updateCardNumber,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(
                      19,
                    ), // 16 digits + 3 spaces
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.getHeight(16)),

          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'expiryDate'.tr,
                      style: AppTextTheme.primary700(size: 14),
                    ),
                    SizedBox(height: AppSize.getHeight(3)),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: CustomTextFormField(
                        controller: controller.expiryDateController,
                        focusNode: controller.expiryDateFocus,
                        hintText: 'MM/YY',
                        keyboardType: TextInputType.number,
                        validator: AppValidation.expiryDate,
                        onChanged: controller.updateExpiryDate,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(
                            5,
                          ), // 4 digits + 1 slash
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: AppSize.getWidth(16)),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CVV', style: AppTextTheme.primary700(size: 14)),
                    SizedBox(height: AppSize.getHeight(3)),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: CustomTextFormField(
                        controller: controller.cvvController,
                        focusNode: controller.cvvFocus,
                        hintText: '123',
                        keyboardType: TextInputType.number,
                        validator: AppValidation.cvv,
                        onChanged: controller.updateCvv,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
