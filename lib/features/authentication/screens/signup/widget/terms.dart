import 'package:ecom3/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TermsandConditions extends StatelessWidget {
  const TermsandConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 22,
          child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value,
              )),
        ),
        const SizedBox(
          width: HSizes.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: HTexts.iAgreeTo,
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${HTexts.privacyPolicy} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? HColors.white : HColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? HColors.white : HColors.primary,
                  )),
          TextSpan(
              text: HTexts.And, style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: ' ${HTexts.termsofuse}',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? HColors.white : HColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? HColors.white : HColors.primary,
                  )),
        ])),
      ],
    );
  }
}
