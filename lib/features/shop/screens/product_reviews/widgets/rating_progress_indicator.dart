import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({super.key, required this.text, required this.value});

  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(text,style: Theme.of(context).textTheme.bodyMedium,),flex: 1,),
        Expanded(flex: 11,child: SizedBox(
          width: HDeviceUtils.getScreenWidth() * 0.8,
          child: LinearProgressIndicator(
            value: value,
            minHeight: 11,
            backgroundColor: HColors.grey,
            borderRadius: BorderRadius.circular(7),
            valueColor: const AlwaysStoppedAnimation(HColors.primary),
          ),
        ),)
      ],
    );
  }
}
