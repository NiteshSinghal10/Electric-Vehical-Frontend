import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/commons/Widgets/common_fab.dart';
import '../../../../core/commons/Widgets/lable.dart';
import '../../../../core/commons/Widgets/text_form_fiels.dart';
import '../../../../core/commons/validators/app_validators.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('resetPasswordTitle'.tr),
        ),
        floatingActionButton: CustomFloatingActionButton(
          onPressed: controller.resetPassword,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 20,
                      children: [
                        const SizedBox(height: 10),
                        InputLabelWidget(text: 'passwordLabel'.tr),
                        Obx(
                          () => TextFormFieldWidget(
                            controller: controller.passwordController,
                            hintText: 'passwordHint'.tr,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: !controller.isPasswordVisible.value,
                            validator: AppValidators.validatePassword,
                            suffix: IconButton(
                              icon: Icon(
                                controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: () =>
                                  controller.isPasswordVisible.toggle(),
                            ),
                            textInputAction: TextInputAction.next,
                            errorMaxLines: 5,
                            onSubmitted: (_) => controller
                                .confirmPasswordFocusNode
                                .requestFocus(),
                          ),
                        ),
                        InputLabelWidget(text: 'confirmPasswordLabel'.tr),
                        Obx(
                          () => TextFormFieldWidget(
                            controller: controller.confirmPasswordController,
                            focusNode: controller.confirmPasswordFocusNode,
                            hintText: 'confirmPasswordHint'.tr,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText:
                                !controller.isConfirmPasswordVisible.value,
                            validator: (value) =>
                                AppValidators.validateConfirmPassword(
                              value,
                              controller.passwordController.text,
                            ),
                            suffix: IconButton(
                              icon: Icon(
                                controller.isConfirmPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: () =>
                                  controller.isConfirmPasswordVisible.toggle(),
                            ),
                            textInputAction: TextInputAction.done,
                            onSubmitted: (_) => controller.resetPassword(),
                          ),
                        ),
                      ],
                    ),
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
      );
}
