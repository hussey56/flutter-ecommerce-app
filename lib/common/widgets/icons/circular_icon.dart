import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class HCircularIcon extends StatelessWidget {
  const HCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = HSizes.lg,
    required this.icon,
    this.color,
    this.backgroudColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroudColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroudColor != null
            ? backgroudColor!
            : dark
                ? HColors.black.withOpacity(0.9)
                : HColors.white.withOpacity(0.9),
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color,
            size: size,
          )),
    );
  }
}
