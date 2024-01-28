import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom3/common/widgets/shimmer/shimmer_loader.dart';
import 'package:ecom3/features/shop/controllers/banner_controller.dart';
import 'package:ecom3/features/shop/controllers/home_controller.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value)
        return const HShimmerEffect(height: 190, width: double.infinity);

      if (controller.banners.isEmpty)
        return const Center(
          child: Text('No Data Found'),
        );

      return Column(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) {
                  controller.updatePageIndicator(index);
                },
              ),
              items: controller.banners
                  .map((banner) => RoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: true,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      ))
                  .toList()),
          const SizedBox(
            height: HSizes.spaceBtwItems,
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < controller.banners.length; i++)
                  TCircularContainer(
                    width: 20,
                    heigth: 4,
                    backgroudColor: controller.carouselCurrentIndex.value == i
                        ? HColors.primary
                        : HColors.grey,
                    margin: const EdgeInsets.only(right: 10),
                  )
              ],
            ),
          )
        ],
      );
    });
  }
}
