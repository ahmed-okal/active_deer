import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../getx/controllers/fitness_class_schedule_controller.dart';
import 'widgets/fitness_class_schedule_view_body.dart';

class FitnessClassScheduleView extends GetView<FitnessClassScheduleController> {
  const FitnessClassScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(top: false, child: const FitnessClassScheduleViewBody()),
    );
  }
}
