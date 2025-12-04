import 'package:active_deer/core/utils/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_primary_button.dart';
import '../getx/controllers/edit_profile_controller.dart';
import 'widgets/edit_profile_date_picker.dart';
import 'widgets/edit_profile_item.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: CustomAppBar(
              title: 'editProfile'.tr,
              notificationIcon: false,
            ),
          ),
          SliverPadding(
            padding: AppPadding.allPadding20,
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Center(
                  child: Stack(
                    children: [
                      Obx(
                        () => ClipOval(
                          child: controller.selectedImage.value != null
                              ? Image.file(
                                  controller.selectedImage.value!,
                                  fit: BoxFit.cover,
                                  height: AppSize.getHeight(126),
                                  width: AppSize.getHeight(126),
                                )
                              : Image.asset(
                                  AppAssets.test,
                                  fit: BoxFit.cover,
                                  height: AppSize.getHeight(126),
                                  width: AppSize.getHeight(126),
                                ),
                        ),
                      ),
                      Positioned(
                        top: AppSize.getHeight(90),
                        child: InkWell(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: Container(
                            height: AppSize.getHeight(25),
                            width: AppSize.getWidth(26),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                AppAssets.edit,
                                height: AppSize.getHeight(16),
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSize.getHeight(20)),
                EditProfileItem(
                  title: 'name'.tr,
                  hint: 'enterFullName'.tr,
                  keynoardType: TextInputType.name,
                  controller: controller.nameController,
                ),
                SizedBox(height: AppSize.getHeight(10)),
                EditProfileItem(
                  title: 'email'.tr,
                  hint: 'mail'.tr,
                  keynoardType: TextInputType.emailAddress,
                  controller: controller.emailController,
                ),
                SizedBox(height: AppSize.getHeight(10)),
                EditProfileItem(
                  title: 'phoneNumber'.tr,
                  hint: 'enterPhoneNumber'.tr,
                  keynoardType: TextInputType.phone,
                  controller: controller.phoneController,
                ),
                SizedBox(height: AppSize.getHeight(10)),
                const EditProfileDatePicker(),
                SizedBox(height: AppSize.getHeight(70)),
                CustomPrimaryButton(title: 'save'.tr, onTap: () {}),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
