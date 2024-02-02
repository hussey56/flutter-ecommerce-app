import 'package:ecom3/common/widgets/shimmer/shimmer_loader.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ListTileShimmer extends StatelessWidget {
  const ListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            HShimmerEffect(height: 50, width: 50,radius: 50,),
            SizedBox(width: HSizes.spaceBtwItems,),
            Column(
              children: [
                HShimmerEffect(height: 15, width: 100),
                SizedBox(height: HSizes.spaceBtwItems/2,),
                HShimmerEffect(height: 12, width: 80),

              ],
            )
          ],
        )
      ],
    );
  }
}
