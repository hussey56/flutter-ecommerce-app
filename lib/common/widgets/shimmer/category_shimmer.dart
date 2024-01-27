import 'package:ecom3/common/widgets/shimmer/shimmer_loader.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryShimmerLoader extends StatelessWidget {
  const CategoryShimmerLoader({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(
          width: HSizes.spaceBtwItems,
        ),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HShimmerEffect(
                height: 55,
                width: 55,
                radius: 55,
              ),
              SizedBox(
                height: HSizes.spaceBtwItems / 2,
              ),
              HShimmerEffect(height: 8, width:55 )
            ],
          );
        },
      ),
    );
  }
}
