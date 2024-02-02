import 'package:ecom3/features/shop/models/brand_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enum.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/container/rounded_container.dart';
import '../images/circular_image.dart';
import '../text/brand_title_with_verified.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key, required this.showBorder, this.onTap, required this.brand,
  });
final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        padding: const EdgeInsets.all(HSizes.sm),
        showBorder: showBorder,
        backgroudColor: Colors.transparent,
        child: Row(
          children: [
            // Icon
            Flexible(
              child: HCircularImage(
                image: brand.image,
                isNetworkImage: true,
                backgroudColor: Colors.transparent,
                overlayColor: dark
                    ? HColors.white
                    : HColors.black,
              ),
            ),
            const SizedBox(
              width: HSizes.spaceBtwItems / 2,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                   BrandTitlewithVerifiedIcon(
                    title:brand.name,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '${brand.productsCount??0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}