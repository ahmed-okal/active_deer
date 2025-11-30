import 'package:get/get.dart';
import 'package:moyasar/moyasar.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/failed_snack_bar.dart';

class PaymentProcessingController extends GetxController {
  final isLoading = false.obs;
  final amount = 100.0.obs;
  final description = 'Payment for services'.obs;
  static const String publishableApiKey =
      AppConstants.paymentPublicableTestApiKey;

  PaymentConfig get paymentConfig => PaymentConfig(
    publishableApiKey: publishableApiKey,
    amount: (amount.value * 100).toInt(),
    description: description.value,
  );

  Future<void> processPayment(Map<String, String> cardData) async {
    try {
      isLoading.value = true;

      if (!_isCardDataValid(cardData)) {
        failedSnaskBar('Invalid card data provided');
        return;
      }

      await Future.delayed(const Duration(seconds: 2));

      bool success = DateTime.now().millisecond % 10 != 0;

      if (success) {
        _handlePaymentSuccess();
      } else {
        _handlePaymentFailure();
      }
    } catch (e) {
      _handlePaymentError(e);
    } finally {
      isLoading.value = false;
    }
  }

  void onPaymentResult(PaymentResponse result) {
    switch (result.status) {
      case PaymentStatus.paid:
      case PaymentStatus.authorized:
      case PaymentStatus.captured:
        _handlePaymentSuccess();
        break;
      case PaymentStatus.failed:
        _handlePaymentFailure();
        break;
      case PaymentStatus.initiated:
        break;
    }
  }

  bool _isCardDataValid(Map<String, String> cardData) {
    return cardData['cardNumber']?.isNotEmpty == true &&
        cardData['expiryDate']?.isNotEmpty == true &&
        cardData['cardHolderName']?.isNotEmpty == true &&
        cardData['cvvCode']?.isNotEmpty == true;
  }

  void _handlePaymentSuccess() {
    Get.toNamed(Routes.paymentSuccess);
  }

  void _handlePaymentFailure() {
    failedSnaskBar('Payment failed. Please try again.');
  }

  void _handlePaymentError(dynamic error) {
    failedSnaskBar('An error occurred: ${error.toString()}');
  }

  void setAmount(double newAmount) {
    amount.value = newAmount;
  }

  void setDescription(String newDescription) {
    description.value = newDescription;
  }

  Map<String, dynamic> getPaymentSummary() {
    return {
      'amount': amount.value,
      'formattedAmount': '${amount.value.toStringAsFixed(2)} SAR',
      'description': description.value,
    };
  }
}
