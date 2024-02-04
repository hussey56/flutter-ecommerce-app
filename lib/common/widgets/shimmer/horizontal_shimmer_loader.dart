import 'package:ecom3/common/widgets/shimmer/shimmer_loader.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HorizontalProductShimmer extends StatelessWidget {
  const HorizontalProductShimmer({super.key, this.itemsCount = 4});

  final int itemsCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: HSizes.spaceBtwSection),
      height: 129,
      child: ListView.separated(
        itemCount: itemsCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: HSizes.spaceBtwItems,
        ),
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            HShimmerEffect(
              width: 120,
              height: 120,
            ),
            SizedBox(
              height: HSizes.spaceBtwItems,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: HSizes.spaceBtwItems / 2,
                ),
                HShimmerEffect(height: 15, width: 160),
                SizedBox(
                  height: HSizes.spaceBtwItems / 2,
                ),
                HShimmerEffect(height: 15, width: 110),
                SizedBox(
                  height: HSizes.spaceBtwItems / 2,
                ),
                HShimmerEffect(height: 15, width: 80),
                Spacer()
              ],
            )
          ],
        ),
      ),
    );
  }
}
