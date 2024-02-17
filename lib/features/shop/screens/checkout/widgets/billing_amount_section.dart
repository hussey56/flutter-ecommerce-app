import 'package:ecom3/features/shop/controllers/product/cart_controller.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/price_calculator.dart';
import 'package:flutter/material.dart';

class BillingAmountWidget extends StatelessWidget {
  const BillingAmountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final subtotal = controller.totalCartPrice.value;
    return Column(
      children: [
        // Sub Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Subtotal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$$subtotal',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: HSizes.spaceBtwItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shipping rate',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${TPricingCalculator.calculateShippingCost(subtotal, 'US')}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(
          height: HSizes.spaceBtwItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tax Fee',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${TPricingCalculator.calculateTax(subtotal, 'US')}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(
          height: HSizes.spaceBtwItems / 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order total',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              '\$${TPricingCalculator.calculatedTotalPrice(subtotal, 'US')}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        )
      ],
    );
  }
}
