import 'package:ecom3/bottom_navigation_bar.dart';
import 'package:ecom3/features/authentication/controllers/login/login_controller.dart';
import 'package:ecom3/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecom3/features/authentication/screens/signup/signup.dart';
import 'package:ecom3/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: HSizes.spaceBtwSection),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => HValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: HTexts.email),
            ),
            const SizedBox(
              height: HSizes.spaceBtwInputFields,
            ),
            // Password
            Obx(() => TextFormField(
                  controller: controller.password,
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
              height: HSizes.spaceBtwInputFields / 2,
            ),

            // Remember me and forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    const Text(HTexts.rememberMe)
                  ],
                ),

                // forget Password
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(HTexts.forgetPassword)),
              ],
            ),
            const SizedBox(
              height: HSizes.spaceBtwSection,
            ),

            // Sign in Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>controller.loginwithemailpassword(),
                child: const Text(HTexts.signIn),
              ),
            ),
            const SizedBox(
              height: HSizes.spaceBtwItems,
            ),
            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpScreen()),
                child: const Text(HTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
