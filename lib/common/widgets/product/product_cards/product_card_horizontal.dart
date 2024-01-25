import 'package:ecom3/common/styles/shadows.dart';
import 'package:ecom3/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom3/common/widgets/images/rounded_image.dart';
import 'package:ecom3/common/widgets/text/brand_title_with_verified.dart';
import 'package:ecom3/common/widgets/text/price_text.dart';
import 'package:ecom3/common/widgets/text/product_title.dart';
import 'package:ecom3/features/shop/screens/product_details/product_detail.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/circular_icon.dart';

class HProductCardHorizontal extends StatelessWidget {
  const HProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetail()),
      child: Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          // boxShadow: [HShadowStyle.horizontalProductShadow],
          borderRadius: BorderRadius.circular(HSizes.productImageRadius),
          color: dark ? HColors.darkerGrey : HColors.softGrey,
        ),
        child: Row(
          children: [
            // Thumbnail
            RoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(HSizes.sm),
              backgroudColor: dark ? HColors.dark : HColors.light,
              child:  Stack(
                  // Thumbnail image
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: RoundedImage(
                        imageUrl: HImages.product4,
                        ApplyImageRadius: true,
                      ),
                    ),
                    Positioned(
                      top: 12,
                      child: RoundedContainer(
                        radius: HSizes.sm,
                        backgroudColor: HColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: HSizes.sm, vertical: HSizes.xs),
                        child: Text(
                          '25%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: HColors.black),
                        ),
                      ),
                    ),

                    // Favorite Button
                    const Positioned(
                        top: 0,
                        right: 0,
                        child: HCircularIcon(
                          icon: Iconsax.heart5,
                          color: Colors.red,
                        ))
                  ]
              ),
            ),
            // Details
            SizedBox(
              width: 172,
              child: Padding(
                padding: EdgeInsets.only(top: HSizes.sm,left: HSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        ProductTitle(title: "Nike Red Shoes OG",smallSize: true,),
                        SizedBox(height: HSizes.spaceBtwItems/2,),
                        BrandTitlewithVerifiedIcon(title: "Nike")
                      ],
                    ),
Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(child: ProductPriceText(price: "256.0")),
                        Container(
                          decoration: const BoxDecoration(
                              color: HColors.dark,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(HSizes.cardRadiusMd),
                                  bottomRight: Radius.circular(
                                      HSizes.productImageRadius))),
                          child: const SizedBox(
                            height: HSizes.iconLg * 1.2,
                            width: HSizes.iconLg * 1.2,
                            child: Center(
                              child: Icon(
                                Iconsax.add,
                                color: HColors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
