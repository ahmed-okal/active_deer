import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../getx/controllers/offers_controller.dart';

class OffersView extends GetView<OffersController> {
  const OffersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OffersView'), centerTitle: true),
      body: const Center(
        child: Text('OffersView is working', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
