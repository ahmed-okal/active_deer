import 'package:active_deer/feature/mySubscription/presentation/views/widgets/my_subscription_tap_item.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/size_config.dart';

class MySubscriptionTapBar extends StatelessWidget {
  const MySubscriptionTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: AppSize.getWidth(20),
        end: AppSize.getWidth(20),
        top: AppSize.getHeight(28),
        bottom: AppSize.getHeight(11),
      ),
      child: SizedBox(
        height: AppSize.getHeight(28),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (context, index) =>
              SizedBox(width: AppSize.getWidth(6)),
          itemBuilder: (context, index) {
            return MySubscriptionTapItem(index);
          },
        ),
      ),
    );
  }
}
