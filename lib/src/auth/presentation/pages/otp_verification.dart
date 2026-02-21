import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/commons/Widgets/common_fab.dart';
import '../../../../core/commons/Widgets/lable.dart';
import '../../../../core/commons/validators/app_validators.dart';
import '../controllers/otp_verification_controller.dart';

class OtpVerificationScreen extends GetView<OtpVerificationController> {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border:
          Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
      borderRadius: BorderRadius.circular(12),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).colorScheme.error),
      borderRadius: BorderRadius.circular(12),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('otp'.tr),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: controller.verifyOtp,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              const SizedBox(height: 10),
              InputLabelWidget(text: 'otpLabel'.tr),
              Center(
                child: Form(
                  key: controller.formKey,
                  child: Pinput(
                    length: 4,
                    controller: controller.otpController,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    errorPinTheme: errorPinTheme,
                    errorTextStyle:
                        Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.error,
                            ),
                    validator: AppValidators.validateOtp,
                    autofillHints: const [AutofillHints.oneTimeCode],
                    onCompleted: (pin) => controller.verifyOtp(),
                  ),
                ),
              ),
              Center(
                child: Obx(() {
                  if (controller.canResend.value) {
                    return TextButton(
                      onPressed: controller.resendOtp,
                      child: Text(
                        'resendOtp'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    );
                  } else {
                    return Text(
                      'resendOtpIn'.trParams({
                        'time': '${controller.resendTimerSeconds.value}s',
                      }),
                      style: Theme.of(context).textTheme.labelMedium,
                    );
                  }
                }),
              ),
              const Spacer(),
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
}
