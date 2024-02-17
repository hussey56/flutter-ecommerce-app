import 'package:ecom3/common/widgets/icons/circular_icon.dart';
import 'package:ecom3/features/shop/controllers/product/cart_controller.dart';
import 'package:ecom3/features/shop/models/product_model.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProduct(product);
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: HSizes.defaultSpace, vertical: HSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? HColors.darkerGrey : HColors.light,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(HSizes.cardRadiusLg),
              topRight: Radius.circular(HSizes.cardRadiusLg))),
      child: Obx(
        ()=> Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Row(
                children: [
                  HCircularIcon(
                    icon: Iconsax.minus,
                    backgroudColor: HColors.darkGrey,
                    color: HColors.white,
                    onPressed: () => controller.productQuantityInCart.value < 1
                        ? null
                        : controller.productQuantityInCart.value -= 1,
                  ),
                  const SizedBox(
                    width: HSizes.spaceBtwItems,
                  ),
                  Text(
                    controller.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    width: HSizes.spaceBtwItems,
                  ),
                  HCircularIcon(
                    icon: Iconsax.add,
                    backgroudColor: HColors.black,
                    color: HColors.white,
                    onPressed: () => controller.productQuantityInCart.value += 1,
                  ),
                ],
              ),
           ElevatedButton(
                onPressed: controller.productQuantityInCart.value < 1
                    ? null
                    : () => controller.addToCart(product),
                child: Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(HSizes.md),
                    backgroundColor: HColors.dark,
                    side: const BorderSide(color: HColors.black)),
              ),

          ],
        ),
      ),
    );
  }
}
