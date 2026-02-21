import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/commons/Widgets/common_fab.dart';
import '../../../../core/commons/Widgets/lable.dart';
import '../../../../core/commons/Widgets/text_form_fiels.dart';
import '../../../../core/commons/formatters/phone_formatter.dart';
import '../../../../core/commons/validators/app_validators.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('login'.tr),
        ),
        floatingActionButton: CustomFloatingActionButton(
          onPressed: controller.login,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 20,
                        children: [
                          const SizedBox(height: 10),
                          InputLabelWidget(text: 'phoneLabel'.tr),
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
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: 2,
                                      ),
                                    ),
                                    counterText: '',
                                  ),
                                  onChanged: (country) {
                                    controller.selectedCountryCode.value =
                                        country.dialCode ?? '+91';
                                  },
                                  textStyle:
                                      Theme.of(context).textTheme.bodyLarge,
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
                            textInputAction: TextInputAction.next,
                          ),
                          InputLabelWidget(text: 'passwordLabel'.tr),
                          Obx(
                            () => TextFormFieldWidget(
                              controller: controller.passwordController,
                              hintText: 'passwordHint'.tr,
                              obscureText: !controller.isPasswordVisible.value,
                              suffix: IconButton(
                                icon: Icon(
                                  controller.isPasswordVisible.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () =>
                                    controller.isPasswordVisible.toggle(),
                              ),
                              errorMaxLines: 5,
                              validator: AppValidators.validatePassword,
                              onSubmitted: (_) => controller.login(),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                Get.log('Forgot Password clicked in UI');
                                controller.forgotPassword();
                              },
                              child: Text(
                                'forgotPassword'.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'iDontHaveAcc'.tr,
                        style: Theme.of(context).textTheme.labelSmall,
                        children: [
                          TextSpan(
                            text: 'signup'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = controller.goToSignup,
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
      );
}
