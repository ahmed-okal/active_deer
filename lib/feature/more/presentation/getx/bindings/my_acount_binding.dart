import 'package:get/get.dart';

import '../../../../../core/services/cash_data_source.dart';
import '../controllers/my_acount_controller.dart';

class MyAcountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAcountController>(() => MyAcountController());
    Get.lazyPut<CashDataSource>(() => CashDataSource());
  }
}
