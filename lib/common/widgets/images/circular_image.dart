import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom3/common/widgets/loaders/shimmer_loader.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class HCircularImage extends StatelessWidget {
  const HCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = HSizes.sm,
    this.fit,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroudColor,
  });

  final double width, height, padding;
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroudColor;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            color: backgroudColor ?? (dark ? HColors.black : HColors.white),
            borderRadius: BorderRadius.circular(100)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
        child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: image,
                    color: overlayColor,
                    fit: fit,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            const HShimmerEffect(
                      height: 55,
                      width: 55,
                      radius: 55,
                    ),
                    errorWidget: (context, ur, error) =>
                        const Icon(Icons.error),
                  )
                : Image(
                    fit: fit, image: AssetImage(image), color: overlayColor),
          ),
        ));
  }
}
