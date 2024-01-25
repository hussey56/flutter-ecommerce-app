import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../text/brand_title_with_verified.dart';
import '../../text/product_title.dart';
class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        // Image
        RoundedImage(
          imageUrl: HImages.product4,
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(HSizes.md),
          backgroundColor:
          dark ? HColors.darkerGrey : HColors.light,
        ),
        const SizedBox(
          width: HSizes.spaceBtwItems,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitlewithVerifiedIcon(
                title: 'Nike',
              ),
              Flexible(
                child: ProductTitle(
                  title: "Black Sport shoes ",
                  maxLines: 1,
                ),
              ),

              //Attributes
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(
                            text:'Color ',
                            style: Theme.of(context).textTheme.bodySmall
                        ),
                        TextSpan(
                            text:'Green',
                            style: Theme.of(context).textTheme.bodyLarge
                        ),
                        TextSpan(
                            text:' Size ',
                            style: Theme.of(context).textTheme.bodySmall
                        ),
                        TextSpan(
                            text:'EU 34',
                            style: Theme.of(context).textTheme.bodyLarge
                        )
                      ]
                  )

              )
            ],
          ),
        ),
      ],
    );
  }
}