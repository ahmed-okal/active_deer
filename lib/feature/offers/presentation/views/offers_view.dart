import 'package:active_deer/feature/offers/presentation/views/widgets/offer_app_bar.dart';
import 'package:active_deer/feature/offers/presentation/views/widgets/offers_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_padding.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../getx/controllers/offers_controller.dart';

class OffersView extends GetView<OffersController> {
  const OffersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: const OffersAppBar(),
          ),
          SliverPadding(
            padding: AppPadding.allPadding20,
            sliver: SliverList.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const OfferItem();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: AppSize.getHeight(18));
              },
            ),
          ),
        ],
      ),
    );
  }
}
