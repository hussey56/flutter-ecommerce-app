import 'package:ecom3/common/widgets/layouts/gridview_layout.dart';
import 'package:ecom3/common/widgets/shimmer/shimmer_loader.dart';
import 'package:flutter/material.dart';

class BrandShimmer extends StatelessWidget {
  const BrandShimmer({super.key,this.itemCount =4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return GridViewLayout(
        itemCount: itemCount,
        mainaxisExtent: 80,
        itemBuilder: (_, __) => HShimmerEffect(height: 80, width: 300));
  }
}
