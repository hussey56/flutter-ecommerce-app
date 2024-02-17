import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';
class ProductQuantitywithAddandRemove extends StatelessWidget {
  const ProductQuantitywithAddandRemove({
    super.key, required this.quantity, this.add, this.remove,
  });
final int quantity;
final VoidCallback? add, remove;

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
          onPressed: remove,
        ),
        const SizedBox(width: HSizes.spaceBtwItems,),
        Text(quantity.toString(),style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: HSizes.spaceBtwItems,),
        HCircularIcon(
          icon: Iconsax.add,
          height: 32,
          width: 32,
          size: HSizes.md,
          color: HColors.white,
          backgroudColor: HColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}