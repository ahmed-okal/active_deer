import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../getx/controllers/my_subscription_controller.dart';

class MySubscriptionView extends GetView<MySubscriptionController> {
  const MySubscriptionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MySubscriptionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MySubscriptionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
