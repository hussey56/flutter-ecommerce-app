import 'package:ecom3/features/personalization/controllers/update_name_controller.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/constants/text_strings.dart';
import 'package:ecom3/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';

class Namehange extends StatelessWidget {
  const Namehange({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: HAppBar(
          showBackArrow: true,
          title: Text(
            'Change Name',
            style: Theme.of(context).textTheme.headlineSmall,
          )),
      body: Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(
              "Use real name for easy evrification. This name will appear on sevral pages",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: HSizes.spaceBtwSection,
            ),
            Form(
              key: controller.updateNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        HValidator.validateEmptyText("first name", value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: HTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: HSizes.spaceBtwInputFields,),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        HValidator.validateEmptyText("last name", value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: HTexts.LastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: HSizes.spaceBtwSection,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ()=>controller.updateUserName(),
                child: const Text('save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
