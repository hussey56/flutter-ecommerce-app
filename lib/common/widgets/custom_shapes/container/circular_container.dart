import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width = 400,
    this.heigth = 400,
    this.child,
    this.radius = 400,
    this.padding = 0,
    this.margin,
    this.backgroudColor = HColors.white,
  });

  final double? width;
  final double? heigth;
  final Widget? child;
  final double radius;
  final double padding;
  final Color backgroudColor;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroudColor),
      child: child,
    );
  }
}