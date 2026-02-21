import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/commons/Widgets/common_fab.dart';
import '../../../../core/commons/Widgets/lable.dart';
import '../../../../core/commons/Widgets/text_form_fiels.dart';
import '../../../../core/commons/formatters/phone_formatter.dart';
import '../../../../core/commons/validators/app_validators.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('forgotPasswordTitle'.tr),
        ),
        floatingActionButton: CustomFloatingActionButton(
          onPressed: controller.submitPhone,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 20,
                      children: [
                        const SizedBox(height: 10),
                        InputLabelWidget(text: 'phoneNumberLabel'.tr),
                        TextFormFieldWidget(
                          prefix: Obx(
                            () => SizedBox(
                              width: Get.width * 0.25,
                              child: CountryCodePicker(
                                showFlagMain: false,
                                searchDecoration: InputDecoration(
                                  hintText: 'search'.tr,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 2,
                                    ),
                                  ),
                                  counterText: '',
                                ),
                                onChanged: (country) {
                                  controller.selectedCountryCode.value =
                                      country.dialCode ?? '+91';
                                },
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                ),
                                initialSelection:
                                    controller.selectedCountryCode.value,
                              ),
                            ),
                          ),
                          controller: controller.phoneController,
                          hintText: 'phoneHint'.tr,
                          keyboardType: TextInputType.phone,
                          validator: AppValidators.validatePhone,
                          maxLength: 10,
                          inputFormatters: [PhoneInputFormatter()],
                          onSubmitted: (_) => controller.submitPhone(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          text: 'iHaveAcc'.tr,
                          style: Theme.of(context).textTheme.labelSmall,
                          children: [
                            TextSpan(
                              text: 'login'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = controller.goToLogin,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
