import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';
class ProductQuantitywithAddandRemove extends StatelessWidget {
  const ProductQuantitywithAddandRemove({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        HCircularIcon(
          icon: Iconsax.minus,
          height: 32,
          width: 32,
          size: HSizes.md,
          color: dark ? HColors.white : HColors.black,
          backgroudColor: dark ? HColors.darkerGrey : HColors.light,
        ),
        const SizedBox(width: HSizes.spaceBtwItems,),
        Text('2',style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: HSizes.spaceBtwItems,),
        HCircularIcon(
          icon: Iconsax.add,
          height: 32,
          width: 32,
          size: HSizes.md,
          color: HColors.white,
          backgroudColor: HColors.primary,
        ),
      ],
    );
  }
}