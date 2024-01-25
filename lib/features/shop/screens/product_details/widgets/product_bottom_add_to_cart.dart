import 'package:ecom3/common/widgets/icons/circular_icon.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: HSizes.defaultSpace, vertical: HSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? HColors.darkerGrey : HColors.light,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(HSizes.cardRadiusLg),
              topRight: Radius.circular(HSizes.cardRadiusLg))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
               HCircularIcon(
                icon: Iconsax.minus,
                backgroudColor: HColors.darkGrey,
                color: HColors.white,
              ),
              const SizedBox(width: HSizes.spaceBtwItems,),
              Text('2',style: Theme.of(context).textTheme.titleSmall,),
              const SizedBox(width: HSizes.spaceBtwItems,),
               HCircularIcon(
                icon: Iconsax.add,
                backgroudColor: HColors.black,
                color: HColors.white,
              ),
            ],
          ),
          ElevatedButton(onPressed: (){}, child: const Text("Add to Cart"),style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(HSizes.md),
            backgroundColor: HColors.dark,
            side: const BorderSide(color: HColors.black)
          ),)
        ],
      ),
    );
  }
}
