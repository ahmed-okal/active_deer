import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/controllers/enter_card_controller.dart';
import 'widgets/enter_card_view_body.dart';

class EnterCardView extends GetView<EnterCardController> {
  const EnterCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(top: false, child: const EnterCardViewBody()),
    );
  }
}
