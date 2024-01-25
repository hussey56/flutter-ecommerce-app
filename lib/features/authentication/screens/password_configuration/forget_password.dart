import 'package:ecom3/features/authentication/controllers/forget_password/forget_controller.dart';
import 'package:ecom3/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/constants/text_strings.dart';
import 'package:ecom3/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: controller.forgetPasswordKey,
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // headings
              Text(
                HTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: HSizes.spaceBtwItems,
              ),
              Text(
                HTexts.forgetPasswrodSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: HSizes.spaceBtwItems * 2),

              // Text Fields
              TextFormField(
                controller: controller.email,
                validator: (value)=>HValidator.validateEmail(value),
                decoration: const InputDecoration(
                    labelText: HTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),

              const SizedBox(height: HSizes.spaceBtwSection),
              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()=>controller.sendPasswordResetEmail(),
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
