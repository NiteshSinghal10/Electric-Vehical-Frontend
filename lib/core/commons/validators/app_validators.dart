import 'package:get/get.dart';

class AppValidators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'nameValidation'.tr;
    }
    if (value.length < 3 || value.length > 30) {
      return 'nameLengthValidation'.tr;
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'phoneValidation'.tr;
    }
    if (value.length != 10) {
      return 'phoneLengthValidation'.tr;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'passwordValidation'.tr;
    }

    // One number, one special char, one uppercase, one lowercase
    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = value.contains(RegExp(r'[a-z]'));
    bool hasDigits = value.contains(RegExp(r'[0-9]'));
    bool hasSpecialCharacters =
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    if (!hasUppercase || !hasLowercase || !hasDigits || !hasSpecialCharacters) {
      return 'passwordComplexityValidation'.tr;
    }

    if (value.length < 6) {
      return 'passwordLengthValidation'.tr;
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'confirmPasswordValidation'.tr;
    }
    if (value != password) {
      return 'passwordMatchValidation'.tr;
    }
    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'otpValidation'.tr;
    }
    if (value.length != 4) {
      return 'otpValidation'.tr;
    }
    return null;
  }
}
