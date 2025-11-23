import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/controllers/my_subscription_controller.dart';
import 'widgets/my_subscription_view_body.dart';

class MySubscriptionView extends GetView<MySubscriptionController> {
  const MySubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(top: false, child: const MySubscriptionViewBody()),
    );
  }
}
