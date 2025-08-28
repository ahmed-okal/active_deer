import 'package:get/get.dart';

class MySubscriptionController extends GetxController {
  final RxInt currentPage = 0.obs;

  void changePage(int index) {
    currentPage.value = index;
  }

  final List<String> pages = ['all'.tr, 'active'.tr, 'expired'.tr];
}
