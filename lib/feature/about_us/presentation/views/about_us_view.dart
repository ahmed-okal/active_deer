import 'package:active_deer/core/theme/app_text_theme.dart';
import 'package:active_deer/core/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../getx/controllers/about_us_controller.dart';

class AboutUsView extends GetView<AboutUsController> {
  const AboutUsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: CustomAppBar(
              title: 'aboutUs'.tr,
              notificationIcon: false,
            ),
          ),
          SliverPadding(
            padding: AppPadding.allPadding20,
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Image.asset(AppAssets.logo, height: AppSize.getHeight(119)),
                SizedBox(height: AppSize.getHeight(10)),
                Text('aboutUs'.tr, style: AppTextTheme.primary700(size: 20)),
                SizedBox(height: AppSize.getHeight(10)),
                Text(
                  'في Active Dear صممنا التطبيق ليكون رفيقك في رحلة لياقتك وصحتك. مهمتنا هي تسهيل الوصول إلى حصص اللياقة وحجزها بسهولة، مع تقديم نصائح غذائية تساعدك على تحقيق أهدافك الصحية بشكل متوازن. \n نهتم بأن نوفّر لك تجربة مرنة تجمع بين التدريب والإرشاد الغذائي، بالإضافة إلى عروض وباقات اشتراك مميزة بالنادي الرياضي لتلبي احتياجاتك المختلفة. \n نحن هنا لنكون الداعم الأول لك نحو أسلوب حياة أكثر نشاطًا وصح',
                  style: AppTextTheme.primary600(size: 16).copyWith(height: 2),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
