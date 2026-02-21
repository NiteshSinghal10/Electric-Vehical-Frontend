import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routes/route_names.dart';

class LoginController extends GetxController {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final RxString selectedCountryCode = '+91'.obs;
  final RxBool isPasswordVisible = false.obs;

  void login() {
    if (formKey.currentState?.validate() ?? false) {
      Get.log(
          'Logging in with ${selectedCountryCode.value}${phoneController.text}');
      // Implement login logic here
    }
  }

  void goToSignup() {
    Get.toNamed<void>(RouteNames.signup);
  }

  void forgotPassword() {
    Get.log('Forgot password clicked');
    // Implement forgot password navigation
  }

  @override
  void onClose() {
    super.onClose();
  }
}
