import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/commons/Widgets/common_fab.dart';
import '../controllers/signup_controller.dart';
import '../widgets/gender_page.dart';
import '../widgets/name_page.dart';
import '../widgets/number_page.dart';
import '../widgets/password_page.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            Obx(
              () => Text.rich(
                TextSpan(
                  text: '${controller.currentPage.value + 1}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                  children: [
                    TextSpan(
                      text: ' / ${controller.totalPages.value}',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        floatingActionButton: CustomFloatingActionButton(
          onPressed: controller.nextPage,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      NamePage(),
                      GenderPage(),
                      NumberPage(),
                      PasswordPage(),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Center(
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
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = controller.goToLogin,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
}
