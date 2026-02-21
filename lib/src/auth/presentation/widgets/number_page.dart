import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/commons/Widgets/lable.dart';
import '../../../../core/commons/Widgets/text_form_fiels.dart';
import '../../../../core/commons/formatters/phone_formatter.dart';
import '../../../../core/commons/validators/app_validators.dart';
import '../controllers/signup_controller.dart';

class NumberPage extends GetView<SignupController> {
  const NumberPage({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            InputLabelWidget(text: 'phoneLabel'.tr),
            Form(
              key: controller.page2FormKey,
              child: TextFormFieldWidget(
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
                            color: Theme.of(context).colorScheme.primary,
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
                      initialSelection: controller.selectedCountryCode.value,
                    ),
                  ),
                ),
                controller: controller.phoneController,
                hintText: 'phoneHint'.tr,
                keyboardType: TextInputType.phone,
                validator: AppValidators.validatePhone,
                maxLength: 10,
                //TODO formater foe other contrie to
                inputFormatters: [PhoneInputFormatter()],
                onSubmitted: (value) {
                  controller.nextPage();
                },
              ),
            ),
          ],
        ),
      );
}
