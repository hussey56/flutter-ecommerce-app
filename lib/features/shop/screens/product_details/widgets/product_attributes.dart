import 'package:ecom3/common/widgets/chips/choice_chip.dart';
import 'package:ecom3/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:ecom3/common/widgets/text/price_text.dart';
import 'package:ecom3/common/widgets/text/product_title.dart';
import 'package:ecom3/common/widgets/text/section_heading.dart';
import 'package:ecom3/utils/constants/colors.dart';
import 'package:ecom3/utils/constants/sizes.dart';
import 'package:ecom3/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // Selected Attributes Pricing and Description
        RoundedContainer(
          padding: const EdgeInsets.all(HSizes.md),
          backgroudColor: dark ? HColors.darkerGrey : HColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  HSectionHeading(
                    title: "Variations",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: HSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitle(title: 'Price : '),
                          // Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: HSizes.spaceBtwItems,
                          ),
                          const ProductPriceText(price: '20'),
                        ],
                      ),
                      Row(
                        children: [
                          const ProductTitle(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              //Variation Description
              ProductTitle(
                title:
                    "This is the Product Description which only goes upto maximum 4 lines.",
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: HSizes.spaceBtwItems,
        ),
        //  Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HSectionHeading(
              title: "Colors",
              showActionButton: false,
            ),
            const SizedBox(
              height: HSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                HChoiceChip(
                  text: "Green",
                  selected: true,
                  Selected: (value) {},
                ),
                HChoiceChip(
                  text: "Blue",
                  selected: false,
                  Selected: (value) {},
                ),
                HChoiceChip(
                  text: "Red",
                  selected: false,
                  Selected: (value) {},
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HSectionHeading(
              title: "Size",
              showActionButton: false,
            ),
            const SizedBox(
              height: HSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                HChoiceChip(
                  text: "EU 32",
                  selected: true,
                  Selected: (value) {},
                ),
                HChoiceChip(
                  text: "EU 34",
                  selected: false,
                  Selected: (value) {},
                ),
                HChoiceChip(
                  text: "EU 38",
                  selected: false,
                  Selected: (value) {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
