import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routes/route_names.dart';

class ForgotPasswordController extends GetxController {
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final RxString selectedCountryCode = '+91'.obs;

  void submitPhone() {
    if (formKey.currentState?.validate() ?? false) {
      Get.log(
          'Submitting phone for reset: ${selectedCountryCode.value}${phoneController.text}');
      // Implement password reset initiation logic here
      Get.toNamed<void>(RouteNames.resetPassword);
    }
  }

  void goToLogin() {
    Get.offNamed<void>(RouteNames.login);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
