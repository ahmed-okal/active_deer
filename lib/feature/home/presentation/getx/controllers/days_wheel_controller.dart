import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaysWheelController extends GetxController {
  final FixedExtentScrollController scrollController =
      FixedExtentScrollController();
  final RxInt selectedIndex = 0.obs;

  void onItemChanged(int index) {
    selectedIndex.value = index;
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
