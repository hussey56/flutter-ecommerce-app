import 'package:ecom3/bottom_navigation_bar.dart';
import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom3/common/widgets/success_screen/success_screen.dart';
import 'package:ecom3/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecom3/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecom3/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecom3/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/product/cart/coupon_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: HAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: Column(
            children: [
              CartItems(
                showAddRemove: false,
              ),
              const SizedBox(
                height: HSizes.spaceBtwSection,
              ),
// Apply Coupon
              CouponCode(),
              const SizedBox(
                height: HSizes.spaceBtwSection,
              ),
              RoundedContainer(
                padding: const EdgeInsets.all(HSizes.md),
                showBorder: true,
                backgroudColor: dark ? HColors.black : HColors.white,
                child: const Column(
                  children: [
                    // Pricing
                    BillingAmountWidget(),
                    SizedBox(
                      height: HSizes.spaceBtwItems,
                    ),
                    // Divider
                    Divider(),
                    // Payment
                    SizedBox(
                      height: HSizes.spaceBtwItems,
                    ),
                    BillingPaymentWidget(),

                    // Address
                    SizedBox(
                      height: HSizes.spaceBtwItems,
                    ),
                    BillingAddressWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => SuccessScreen(
                  image: HImages.staticSuccessIllustration,
                  title: 'Payment Successful',
                  subTitle: 'Your item will be Shipped soon.',
                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                ));
          },
          child: Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
