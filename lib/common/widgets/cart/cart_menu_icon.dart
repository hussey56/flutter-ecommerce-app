import 'package:ecom3/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/shop/screens/cart/cart.dart';
import '../../../utils/constants/colors.dart';
class HCartCounterIcon extends StatelessWidget {
  const HCartCounterIcon({
    super.key,
    required this.iconColor,
  });

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Stack(
      children: [
        IconButton(
          onPressed: () =>  Get.to(()=> const CartScreen()),
          icon: const Icon(Iconsax.shopping_bag),
          color: iconColor,
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: HColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                ()=> Text(
                  controller.noOfCartItems.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: HColors.white, fontSizeFactor: 0.8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
