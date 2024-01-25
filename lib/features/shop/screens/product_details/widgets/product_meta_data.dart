import 'package:ecom3/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom3/common/widgets/images/circular_image.dart';
import 'package:ecom3/common/widgets/text/brand_title_with_verified.dart';
import 'package:ecom3/common/widgets/text/price_text.dart';
import 'package:ecom3/utils/constants/enum.dart';
import 'package:ecom3/utils/constants/image_strings.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/text/product_title.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price & Sale Price
        Row(
          children: [
            RoundedContainer(
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
            const SizedBox(
              width: HSizes.spaceBtwItems,
            ),

            //Price
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: HSizes.spaceBtwItems,
            ),
            const ProductPriceText(
              price: '175',
              isLarge: true,
            )
          ],
        ),
        const SizedBox(
          height: HSizes.spaceBtwItems / 1.5,
        ),

        // Title
        const ProductTitle(
          title: 'Nike Blue Oxygen 67',
        ),
        const SizedBox(
          height: HSizes.spaceBtwItems / 1.5,
        ),

        // Stock Status
        Row(children: [
          const ProductTitle(
            title: 'Stock',
          ),
          const SizedBox(
            width: HSizes.spaceBtwItems,
          ),
          Text(
            'In Stock',
            style: Theme.of(context).textTheme.titleMedium,
          )
        ]),
        const SizedBox(
          height: HSizes.spaceBtwItems / 1.5,
        ),
        // Brand
        Row(
          children: [
            HCircularImage(
              image: HImages.cosmeticIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? HColors.white : HColors.black,
            ),
            const BrandTitlewithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
