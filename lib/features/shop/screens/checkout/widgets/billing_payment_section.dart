import 'package:ecom3/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom3/common/widgets/text/section_heading.dart';
import 'package:ecom3/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillingPaymentWidget extends StatelessWidget {
  const BillingPaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller =CheckoutController.instance;
    return Column(
      children: [
        HSectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          showActionButton: true,
          onPressed: ()=>controller.selectPaymentMethod(context),
        ),
        const SizedBox(
          height: HSizes.spaceBtwItems / 2,
        ),
        Obx(
          ()=> Row(
            children: [
              RoundedContainer(
                width: 60,
                height: 35,
                backgroudColor: dark ? HColors.light : HColors.white,
                padding: const EdgeInsets.all(HSizes.sm),
                child: Image(
                  image: AssetImage(controller.selectedPaymentMethod.value.image),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: HSizes.spaceBtwItems / 2,
              ),
              Text(controller.selectedPaymentMethod.value.name,style: Theme.of(context).textTheme.bodyLarge,)
            ],
          ),
        )
      ],
    );
  }
}
