import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class GridViewLayout extends StatelessWidget {
  const GridViewLayout(
      {super.key, required this.itemCount, this.mainaxisExtent = 288, required this.itemBuilder});

  final int itemCount;
  final double? mainaxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: HSizes.gridViewSpacing,
        crossAxisSpacing: HSizes.gridViewSpacing,
        mainAxisExtent: mainaxisExtent,
      ),
      itemBuilder
      : itemBuilder,
    );
  }
}
