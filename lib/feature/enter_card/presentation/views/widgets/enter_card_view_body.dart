import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../getx/controllers/enter_card_controller.dart';

class EnterCardViewBody extends GetView<EnterCardController> {
  const EnterCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: <Widget>[
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          flexibleSpace: CustomAppBar(title: 'idCard'.tr),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('qrCode'.tr, style: AppTextTheme.primary700(size: 20)),
              Text(
                'thisIsYourDigitalIdCode'.tr,
                style: AppTextTheme.primary700(size: 14),
              ),
              SizedBox(height: AppSize.getHeight(16)),
              Container(
                height: AppSize.getHeight(330),
                width: AppSize.getHeight(330),
                padding: EdgeInsets.all(AppSize.getHeight(8)),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.secondry,
                    width: AppSize.getHeight(1),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: QrImageView(
                    data: '',
                    version: QrVersions.auto,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
