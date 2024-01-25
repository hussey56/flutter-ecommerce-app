import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return HCurvedEdgeWidget(
      child: Container(
        color: dark ? HColors.darkerGrey : HColors.light,
        child: Stack(
          children: [
            // main large image
            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(HSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(HImages.product3),
                  ),
                ),
              ),
            ),

            // image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: HSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: HSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => RoundedImage(
                    imageUrl: HImages.product4,
                    width: 80,
                    backgroundColor:
                    dark ? HColors.dark : HColors.white,
                    border: Border.all(color: HColors.primary),
                    padding: const EdgeInsets.all(HSizes.sm),
                  ),
                ),
              ),
            ),

            // App bar
            const HAppBar(
              showBackArrow: true,
              actions: [
                HCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}