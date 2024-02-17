import 'package:ecom3/features/shop/controllers/product/cart_controller.dart';
import 'package:ecom3/features/shop/screens/product_details/product_detail.dart';
import 'package:ecom3/utils/constants/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ProductAddtoCartButton extends StatelessWidget {
  const ProductAddtoCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItem = controller.converttoCartItem(product, 1);
          controller.addOnetoCart(cartItem);
        } else {
          Get.to(()=> ProductDetail(product: product));
        }
      },
      child: Obx(() {
        final quantity = controller.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
              color: quantity > 0 ? HColors.primary : HColors.dark,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(HSizes.cardRadiusMd),
                  bottomRight: Radius.circular(HSizes.productImageRadius))),
          child: SizedBox(
            height: HSizes.iconLg * 1.2,
            width: HSizes.iconLg * 1.2,
            child: Center(
              child: quantity > 0
                  ? Text(
                      quantity.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: HColors.white),
                    )
                  : const Icon(
                      Iconsax.add,
                      color: HColors.white,
                    ),
            ),
          ),
        );
      }),
    );
  }
}
