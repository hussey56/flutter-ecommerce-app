import 'package:ecom3/common/widgets/layouts/gridview_layout.dart';
import 'package:ecom3/common/widgets/shimmer/shimmer_loader.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HVerticalProductShimmer extends StatelessWidget {
  const HVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridViewLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HShimmerEffect(height: 180, width: 180),
            SizedBox(
              height: HSizes.spaceBtwItems,
            ),
            HShimmerEffect(width: 160, height: 15),
            SizedBox(
              height: HSizes.spaceBtwItems / 2,
            ),
            HShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
