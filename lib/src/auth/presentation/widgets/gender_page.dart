import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/commons/Widgets/lable.dart';
import '../../../../core/constant/assets_names.dart';
import '../../../../core/constant/enums.dart';
import '../controllers/signup_controller.dart';

class GenderPage extends GetView<SignupController> {
  const GenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    const itemWidth = 150.0;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          InputLabelWidget(text: 'genderLabel'.tr),
          Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                _GenderOption(
                  title: 'Male',
                  gender: Gender.male,
                  lottieAsset: AssetsNames.maleLottie,
                  width: itemWidth,
                ),
                _GenderOption(
                  title: 'Female',
                  gender: Gender.female,
                  lottieAsset: AssetsNames.femaleLottie,
                  width: itemWidth,
                ),
                _GenderOption(
                  title: 'Other',
                  gender: Gender.other,
                  lottieAsset: AssetsNames.otherLottie,
                  width: itemWidth,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GenderOption extends StatelessWidget {
  const _GenderOption({
    required this.title,
    required this.gender,
    required this.lottieAsset,
    required this.width,
  });

  final String title;
  final Gender gender;
  final String lottieAsset;
  final double width;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SignupController>();

    return Obx(() {
      final isSelected = controller.selectedGender.value == gender;

      return GestureDetector(
        onTap: () => controller.selectGender = gender,
        child: Container(
          width: width,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.surface,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                lottieAsset,
                width: width,
                height: width,
                fit: BoxFit.contain,
              ),
              Text(title, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      );
    });
  }
}
