import 'package:ecom3/common/widgets/images/circular_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class HVerticalImageText extends StatelessWidget {
  const HVerticalImageText(
      {super.key,
      required this.image,
      required this.text,
      this.textColor = HColors.white,
      this.backgroudColor = HColors.white,
      this.onTap,
      this.isNetworkImage = false});

  final String image, text;
  final Color textColor;
  final Color? backgroudColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: HSizes.spaceBtwItems),
        child: Column(
          children: [
            HCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: HSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroudColor: backgroudColor,
              overlayColor: dark ? HColors.light : HColors.dark,
            ),
            const SizedBox(
              height: HSizes.spaceBtwItems / 2,
            ),
            SizedBox(
                width: 55,
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
      ),
    );
  }
}
