import 'package:ecom3/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecom3/features/authentication/screens/signup/verify_email.dart';
import 'package:ecom3/features/authentication/screens/signup/widget/terms.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:ecom3/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class HSignupForm extends StatelessWidget {
  const HSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final dark = THelperFunctions.isDarkMode(context);
    return Form(
      key: controller.signupFormkey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstname,
                  expands: false,
                  validator: (value) =>
                      HValidator.validateEmptyText('First Name', value),
                  decoration: const InputDecoration(
                      labelText: HTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: HSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastname,
                  validator: (value) =>
                      HValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: HTexts.LastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: HSizes.spaceBtwInputFields,
          ),

          // Username
          TextFormField(
            controller: controller.username,
            expands: false,
            validator: (value) =>
                HValidator.validateEmptyText('Username', value),
            decoration: const InputDecoration(
                labelText: HTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: HSizes.spaceBtwInputFields,
          ),
          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => HValidator.validateEmail(value),
            decoration: const InputDecoration(
                labelText: HTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: HSizes.spaceBtwInputFields,
          ),
          // Phone
          TextFormField(
            controller: controller.phone,
            validator: (value) => HValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
                labelText: HTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),

          const SizedBox(
            height: HSizes.spaceBtwInputFields,
          ),

          /// Passwords
          Obx(() => TextFormField(
                controller: controller.password,
                obscureText: controller.hidepassword.value,
                validator: (value) => HValidator.validatePassword(value),
                decoration: InputDecoration(
                    labelText: HTexts.password,
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidepassword.value =
                            !controller.hidepassword.value,
                        icon: Icon(controller.hidepassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye))),
              )),

          const SizedBox(
            height: HSizes.spaceBtwInputFields,
          ),

          // Terms and Condition Fileds
          const TermsandConditions(),
          const SizedBox(
            height: HSizes.spaceBtwSection,
          ),
          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(HTexts.createAccount),
            ),
          )
        ],
      ),
    );
  }
}
