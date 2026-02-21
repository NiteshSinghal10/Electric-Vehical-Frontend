import 'package:flutter/services.dart';

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(' ', '');

    // Only allow digits
    if (RegExp(r'[^0-9]').hasMatch(text)) {
      return oldValue;
    }

    // Limit to 10 digits
    if (text.length > 10) {
      return oldValue;
    }

    // Format: XXXXX XXXXX
    String formatted = '';
    for (int i = 0; i < text.length; i++) {
      formatted += text[i];
      if (i == 4 && text.length > 5) {
        formatted += ' ';
      }
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
