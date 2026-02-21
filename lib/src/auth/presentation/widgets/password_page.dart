import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/commons/Widgets/lable.dart';
import '../../../../core/commons/Widgets/text_form_fiels.dart';
import '../controllers/signup_controller.dart';
import '../../../../core/commons/validators/app_validators.dart';

class PasswordPage extends GetView<SignupController> {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Form(
          key: controller.page3FormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
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
                    onPressed: () => controller.isPasswordVisible.toggle(),
                  ),
                  errorMaxLines: 5,
                  validator: AppValidators.validatePassword,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) =>
                      controller.confirmPasswordFocusNode.requestFocus(),
                ),
              ),
              InputLabelWidget(text: 'confirmPasswordLabel'.tr),
              Obx(
                () => TextFormFieldWidget(
                  controller: controller.confirmPasswordController,
                  focusNode: controller.confirmPasswordFocusNode,
                  hintText: 'confirmPasswordHint'.tr,
                  obscureText: !controller.isConfirmPasswordVisible.value,
                  suffix: IconButton(
                    icon: Icon(
                      controller.isConfirmPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () =>
                        controller.isConfirmPasswordVisible.toggle(),
                  ),
                  validator: (value) => AppValidators.validateConfirmPassword(
                    value,
                    controller.passwordController.text,
                  ),
                  onSubmitted: (value) {
                    controller.nextPage();
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
