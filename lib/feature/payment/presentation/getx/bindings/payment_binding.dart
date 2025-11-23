import 'package:active_deer/core/services/cash_data_source.dart';
import 'package:active_deer/injection_controller.dart';
import 'package:get/get.dart';
import '../controllers/credit_card_form_controller.dart';
import '../controllers/payment_controller.dart';
import '../controllers/payment_processing_controller.dart';
import '../controllers/save_card_controller.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentProcessingController>(
      () => PaymentProcessingController(),
    );
    Get.lazyPut<PaymentController>(() => PaymentController());
    Get.lazyPut<CreditCardFormController>(() => CreditCardFormController());
    Get.lazyPut<CashDataSource>(() => CashDataSource());
    Get.lazyPut<SavedCardsController>(
      () => SavedCardsController(
        InjectionController().getIt(),
        InjectionController().getIt(),
      ),
    );
  }
}
