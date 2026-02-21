import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/enums.dart';
import '../../../../core/routes/route_names.dart';

class SignupController extends GetxController {
  void goToLogin() {
    Get.offAllNamed<void>(RouteNames.login);
  }

  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  final RxInt totalPages = 4.obs;

  //page1
  final TextEditingController nameController = TextEditingController();
  final page1FormKey = GlobalKey<FormState>();
  // page2
  final Rx<Gender> selectedGender = Gender.male.obs;
  // page3
  final RxString selectedCountryCode = '+91'.obs;
  final TextEditingController phoneController = TextEditingController();
  final page2FormKey = GlobalKey<FormState>();

  // page4
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;
  final page3FormKey = GlobalKey<FormState>();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  @override
  void onInit() {
    super.onInit();
    pageController.addListener(_pageListener);
  }

  void _pageListener() {
    currentPage.value = pageController.page?.round() ?? 0;
  }

  bool _validateCurrentPage() {
    switch (currentPage.value) {
      case 0:
        return page1FormKey.currentState?.validate() ?? true;
      case 1:
        return true; // GenderPage (no form)
      case 2:
        return page2FormKey.currentState?.validate() ?? true; // NumberPage
      case 3:
        return page3FormKey.currentState?.validate() ?? true; // PasswordPage
      default:
        return true;
    }
  }

  void nextPage() {
    if (_validateCurrentPage()) {
      if (currentPage.value < totalPages.value - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        Get.toNamed<void>(RouteNames.otpVerification);
      }
    }
  }

  void goToPage(int page) {
    if (page == currentPage.value || _validateCurrentPage()) {
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Gender get selectGender => selectedGender.value;
  set selectGender(Gender gender) {
    selectedGender.value = gender;
  }

  @override
  void onClose() {
    pageController.dispose();
    confirmPasswordFocusNode.dispose();
    super.onClose();
  }
}
