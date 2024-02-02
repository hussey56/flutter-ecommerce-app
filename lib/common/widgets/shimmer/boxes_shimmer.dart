import 'package:ecom3/common/widgets/shimmer/shimmer_loader.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BoxesShimmer extends StatelessWidget {
  const BoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: HShimmerEffect(width: 150,height: 110,)),
            SizedBox(width: HSizes.spaceBtwItems,),
            Expanded(child: HShimmerEffect(width: 150,height: 110,)),
            SizedBox(width: HSizes.spaceBtwItems,),
            Expanded(child: HShimmerEffect(width: 150,height: 110,)),
            SizedBox(width: HSizes.spaceBtwItems,),
          ],
        )
      ],
    );
  }
}
