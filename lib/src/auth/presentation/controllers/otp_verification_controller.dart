import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/route_names.dart';

class OtpVerificationController extends GetxController {
  final otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void goToLogin() {
    Get.offAllNamed<void>(RouteNames.login);
  }

  void goToSignup() {
    Get.offAllNamed<void>(RouteNames.signup);
  }

  final RxInt resendTimerSeconds = 60.obs;
  final RxBool canResend = false.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    canResend.value = false;
    resendTimerSeconds.value = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendTimerSeconds.value > 0) {
        resendTimerSeconds.value--;
      } else {
        canResend.value = true;
        _timer?.cancel();
      }
    });
  }

  void resendOtp() {
    if (canResend.value) {
      // Logic to resend OTP
      startTimer();
    }
  }

  void verifyOtp() {
    if (formKey.currentState?.validate() ?? false) {
      final otp = otpController.text;
      if (otp.length == 4) {
        // Logic to verify OTP
        Get.log("Verifying OTP: $otp");
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
    _timer?.cancel();
  }
}
