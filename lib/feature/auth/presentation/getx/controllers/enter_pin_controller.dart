import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../core/widgets/failed_snack_bar.dart';
import '../../../../../core/widgets/success_snack_bar.dart';

class EnterPinController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  // Observables
  final RxBool isTimerRunning = false.obs;
  final RxInt currentTimerCount = 0.obs;
  final RxInt resendAttempts = 0.obs;

  Timer? _timer;

  static const _durations = [60, 180, 300, 1800];
  static const int maxAttempts = 3;

  void startTimer() {
    _timer?.cancel();

    if (resendAttempts.value >= maxAttempts) return;

    final duration = _durations[resendAttempts.value];
    currentTimerCount.value = duration;
    isTimerRunning.value = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentTimerCount.value > 0) {
        currentTimerCount.value--;
      } else {
        timer.cancel();
        isTimerRunning.value = false;
      }
    });
  }

  /// Handle resend code action
  void onResendCodeTapped() {
    if (isTimerRunning.value) return;

    if (resendAttempts.value >= maxAttempts - 1) {
      failedSnaskBar('tryAgainLater'.tr);
      return;
    }

    resendAttempts.value++;
    startTimer();
    successSnackBar('verificationCodeSentSuccessfully'.tr);
  }

  /// Timer formatted as MM:SS
  String get formattedTime {
    final minutes = currentTimerCount.value ~/ 60;
    final seconds = currentTimerCount.value % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  bool get canResend =>
      !isTimerRunning.value && resendAttempts.value < maxAttempts - 1;

  String get resendMessage => resendAttempts.value >= maxAttempts - 1
      ? 'tryAgainLater'.tr
      : 'didntReceiveTheCode'.tr;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
