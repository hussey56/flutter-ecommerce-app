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
    super.key, required this.showBorder, this.onTap,
  });

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
                image: HImages.animalIcon,
                isNetworkImage: false,
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
                  const BrandTitlewithVerifiedIcon(
                    title: "Monkey",
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 products',
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