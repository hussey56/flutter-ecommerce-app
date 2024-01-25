import 'package:ecom3/common/widgets/appbar/appbar.dart';
import 'package:ecom3/common/widgets/icons/circular_icon.dart';
import 'package:ecom3/common/widgets/images/rounded_image.dart';
import 'package:ecom3/common/widgets/text/brand_title_with_verified.dart';
import 'package:ecom3/common/widgets/text/price_text.dart';
import 'package:ecom3/common/widgets/text/product_title.dart';
import 'package:ecom3/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecom3/features/shop/screens/checkout/checkout.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/product/cart/add_remove_button.dart';
import '../../../../common/widgets/product/cart/cart_item.dart';
import '../../../../utils/constants/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: HAppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(HSizes.defaultSpace),
          child: CartItems()
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(HSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Get.to(()=> const CheckoutScreen());
          },
          child: Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
