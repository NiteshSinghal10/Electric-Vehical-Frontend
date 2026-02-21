import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.isEditable = true,
    this.prefix,
    this.suffix,
    this.onSubmitted,
    this.onEditingComplete,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.obscureText = false,
    this.maxLength,
    this.keyboardType,
    this.errorMaxLines = 2,
    this.inputFormatters,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.focusNode,
  });
  final TextEditingController controller;
  final String hintText;
  final bool isEditable;
  final Widget? prefix;
  final Widget? suffix;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final int? errorMaxLines;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
          ),
          prefixIcon: prefix,
          suffixIcon: suffix,
          counterText: '',
          errorMaxLines: errorMaxLines,
        ),
        style: const TextStyle(
          fontSize: 20,
        ),
        enabled: isEditable,
        onFieldSubmitted: onSubmitted,
        onEditingComplete: onEditingComplete,
        textInputAction: textInputAction,
        validator: validator,
        obscureText: obscureText,
        maxLength: maxLength,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        autovalidateMode: autovalidateMode,
        focusNode: focusNode,
      );
}
