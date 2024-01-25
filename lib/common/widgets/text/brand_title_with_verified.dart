import 'package:ecom3/common/widgets/text/brand_title.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enum.dart';
import '../../../utils/constants/sizes.dart';

class BrandTitlewithVerifiedIcon extends StatelessWidget {
  const BrandTitlewithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = HColors.primary,
    this.align = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? align;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child:BrandTitleText(
          title: title,
          color: textColor,
          maxLines: maxLines,
          textAlign: align,
          brandTextSize: brandTextSize,
        )),
        const SizedBox(
          width: HSizes.xs,
        ),
        const Icon(
          Iconsax.verify5,
          color: HColors.primary,
          size: HSizes.iconXs,
        )
      ],
    );
  }
}
