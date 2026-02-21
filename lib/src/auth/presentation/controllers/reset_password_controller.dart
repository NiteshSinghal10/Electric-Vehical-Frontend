import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routes/route_names.dart';

class ResetPasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final confirmPasswordFocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;

  void resetPassword() {
    if (formKey.currentState?.validate() ?? false) {
      Get.log('Resetting password...');
      // Implement password reset logic here
      Get.offAllNamed<void>(RouteNames.login);
    }
  }

  void goToLogin() {
    Get.offAllNamed<void>(RouteNames.login);
  }

  @override
  void onClose() {
    confirmPasswordFocusNode.dispose();
    super.onClose();
  }
}
