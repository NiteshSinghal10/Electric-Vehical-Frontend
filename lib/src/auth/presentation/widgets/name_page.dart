import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/commons/Widgets/lable.dart';
import '../../../../core/commons/Widgets/text_form_fiels.dart';
import '../controllers/signup_controller.dart';
import '../../../../core/commons/validators/app_validators.dart';

class NamePage extends GetView<SignupController> {
  const NamePage({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            InputLabelWidget(text: 'nameLabel'.tr),
            Form(
              key: controller.page1FormKey,
              child: TextFormFieldWidget(
                controller: controller.nameController,
                hintText: 'nameHint'.tr,
                validator: AppValidators.validateName,
                maxLength: 30,
                onSubmitted: (value) {
                  controller.nextPage();
                },
              ),
            ),
          ],
        ),
      );
}
