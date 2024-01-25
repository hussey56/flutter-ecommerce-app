import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';
class HContainerSearchBar extends StatelessWidget {
  const HContainerSearchBar({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: HSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: HDeviceUtils.getScreenWidth(),
          padding: const EdgeInsets.all(HSizes.md),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                  ? HColors.dark
                  : HColors.white
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(HSizes.cardRadiusLg),
              border: showBorder ? Border.all(color: HColors.grey) : null),
          child: Row(
            children: [
              Icon(
                icon,
                color: HColors.darkerGrey,
              ),
              const SizedBox(
                width: HSizes.spaceBtwItems,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}