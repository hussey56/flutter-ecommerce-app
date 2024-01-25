import 'package:ecom3/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class HChoiceChip extends StatelessWidget {
  const HChoiceChip(
      {super.key, required this.text, required this.selected, this.Selected});

  final String text;
  final bool selected;
  final void Function(bool)? Selected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: Selected,
        labelStyle: TextStyle(color: selected ? HColors.white : null),
        avatar: isColor
            ? TCircularContainer(
                width: 50,
                heigth: 50,
                backgroudColor: THelperFunctions.getColor(text)!)
            : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? THelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
