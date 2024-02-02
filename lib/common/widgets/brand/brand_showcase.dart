import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom3/common/widgets/shimmer/shimmer_loader.dart';
import 'package:ecom3/features/shop/models/brand_model.dart';
import 'package:ecom3/features/shop/screens/brands/brand_products.dart';
import 'package:ecom3/features/shop/screens/brands/brands.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/container/rounded_container.dart';
import 'brand_card.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images, required this.brands,
  });

  final List<String> images;
  final BrandModel brands;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: ()=> Get.to(()=>BrandProducts(brand: brands)),
      child: RoundedContainer(
        showBorder: true,
        borderColor: HColors.darkGrey,
        backgroudColor: Colors.transparent,
        padding: const EdgeInsets.all(HSizes.md),
        margin: const EdgeInsets.only(bottom: HSizes.spaceBtwItems),
        child: Column(
          children: [
            // Brands with Product Count
             BrandCard(showBorder: false,brand: brands,),
            // top three product images
            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroudColor: dark ? HColors.darkerGrey : HColors.light,
        margin: const EdgeInsets.only(right: HSizes.sm),
        padding: const EdgeInsets.all(HSizes.md),
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context,url,downloadProgress)=>HShimmerEffect(height: 100, width: 100),
errorWidget: (context,url,error)=> const Icon(Icons.error),
        )
      ),
    );
  }
}