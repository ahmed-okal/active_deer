import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../getx/controllers/nutritional_advice_controller.dart';

class NutritionalAdviceView extends GetView<NutritionalAdviceController> {
  const NutritionalAdviceView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NutritionalAdviceView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NutritionalAdviceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
