import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../shimmer/shimmer_loader.dart';
class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.ApplyImageRadius = true,
    this.border,
    this.backgroundColor ,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = HSizes.md,
  });

  final double borderRadius;
  final double? width, height;
  final String imageUrl;
  final bool ApplyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
            borderRadius: ApplyImageRadius
                ? BorderRadius.circular(borderRadius)
                : BorderRadius.zero,
            child: isNetworkImage ?
                CachedNetworkImage(imageUrl: imageUrl,fit: fit, progressIndicatorBuilder:
                    (context, url, downloadProgress) =>
                 HShimmerEffect(
                  height: 190,
                  width: double.infinity,
                  radius: borderRadius,
                ),
                  errorWidget: (context, ur, error) =>
                  const Icon(Icons.error),
                )
                :Image(
              image: AssetImage(imageUrl),
              fit: fit,
            )),
      ),
    );
  }
}