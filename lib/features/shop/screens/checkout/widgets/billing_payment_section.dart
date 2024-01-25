import 'package:ecom3/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom3/common/widgets/text/section_heading.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BillingPaymentWidget extends StatelessWidget {
  const BillingPaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        HSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          showActionButton: true,
        ),
        const SizedBox(
          height: HSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              backgroudColor: dark ? HColors.light : HColors.white,
              padding: const EdgeInsets.all(HSizes.sm),
              child: const Image(
                image: AssetImage(HImages.google),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: HSizes.spaceBtwItems / 2,
            ),
            Text('G Pay',style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}
