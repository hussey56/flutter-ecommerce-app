import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/container/rounded_container.dart';
import 'brand_card.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      borderColor: HColors.darkGrey,
      backgroudColor: Colors.transparent,
      padding: const EdgeInsets.all(HSizes.md),
      margin: const EdgeInsets.only(bottom: HSizes.spaceBtwItems),
      child: Column(
        children: [
          // Brands with Product Count
          const BrandCard(showBorder: false),
          // top three product images
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroudColor: dark ? HColors.darkerGrey : HColors.light,
        margin: const EdgeInsets.only(right: HSizes.sm),
        padding: const EdgeInsets.all(HSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}