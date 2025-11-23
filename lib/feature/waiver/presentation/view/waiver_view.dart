import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../getx/controllers/waiver_controller.dart';
import '../widgets/waiver_form_fields.dart';
import '../widgets/waiver_submit_button.dart';

class WaiverView extends GetView<WaiverController> {
  const WaiverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              flexibleSpace: CustomAppBar(
                title: 'waiver'.tr,
                notificationIcon: false,
              ),
            ),
            SliverPadding(
              padding: AppPadding.allPadding20,
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const WaiverFormFields(),
                  SizedBox(height: AppSize.getHeight(150)),
                  const WaiverSubmitButton(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
