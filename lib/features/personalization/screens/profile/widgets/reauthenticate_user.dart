import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/features/personalization/controllers/user_controller.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/constants/text_strings.dart';
import 'package:ecom3/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthenticateUser extends StatelessWidget {
  const ReAuthenticateUser({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.insatnce;
    return Scaffold(
      appBar: HAppBar(
        title: Text(
          "Re-Authenticate Yourself",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value) => HValidator.validateEmail(value),
                  decoration: const InputDecoration(
                      labelText: HTexts.email,
                      prefixIcon: const Icon(Iconsax.direct_right)),
                ),
                const SizedBox(
                  height: HSizes.spaceBtwInputFields,
                ),
                Obx(() => TextFormField(
                      controller: controller.verfiyPassword,
                      obscureText: controller.hidePassword.value,
                      validator: (value) =>
                          HValidator.validateEmptyText('Password', value),
                      decoration: InputDecoration(
                          labelText: HTexts.password,
                          prefixIcon: Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                              onPressed: () => controller.hidePassword.value =
                                  !controller.hidePassword.value,
                              icon: Icon(controller.hidePassword.value
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye))),
                    )),
                const SizedBox(
                  height: HSizes.spaceBtwSection,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.reAuthenticateEmailPassword(),
                    child: const Text("Authenticate"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
